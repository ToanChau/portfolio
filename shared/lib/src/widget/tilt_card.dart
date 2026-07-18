import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Wraps [child] in a perspective transform that leans toward the cursor, with
/// an optional specular highlight that tracks it across the surface.
///
/// The tilt is driven by an [AnimationController] rather than applied straight
/// from the pointer, so leaving the card eases it back to rest instead of
/// snapping flat.
///
/// Honours the platform's reduced-motion setting by rendering [child] untouched.
class TiltCard extends StatefulWidget {
  final Widget child;

  /// Maximum lean, in degrees, at the corners of the card.
  final double maxTilt;

  /// How far the card rises on hover, in logical pixels.
  ///
  /// This is a vertical lift, not a translation toward the viewer. Moving a
  /// card along +Z (or scaling it up) widens it under the perspective divide,
  /// and in a tight [Row] it grows into its neighbour — which then paints over
  /// it, since a Row paints its children in order.
  final double hoverLift;

  /// Scale applied on hover. Values above 1.0 widen the card and risk the same
  /// overlap as [hoverLift] once described; leave at 1.0 inside a Row.
  final double hoverScale;

  /// Colour of the moving specular highlight. Null disables the glare.
  final Color? glareColor;

  /// Corner radius used to clip the glare. Should match the child's own radius.
  final BorderRadius borderRadius;

  const TiltCard({
    super.key,
    required this.child,
    this.maxTilt = 6.0,
    this.hoverLift = 10.0,
    this.hoverScale = 1.0,
    this.glareColor = const Color(0x26FFFFFF),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  State<TiltCard> createState() => _TiltCardState();
}

class _TiltCardState extends State<TiltCard> with SingleTickerProviderStateMixin {
  late final AnimationController _hover = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
    reverseDuration: const Duration(milliseconds: 420),
  );

  late final Animation<double> _eased = CurvedAnimation(
    parent: _hover,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeOutQuart,
  );

  /// Cursor position within the card, each axis in [-1, 1].
  Offset _pointer = Offset.zero;

  bool get _reduceMotion => MediaQuery.disableAnimationsOf(context);

  @override
  void dispose() {
    _hover.dispose();
    super.dispose();
  }

  /// Normalises against the laid-out box rather than the incoming constraints:
  /// inside an [IntrinsicHeight] or an unbounded [Row] the constraints can be
  /// infinite, which would make the pointer maths collapse to zero.
  void _onHover(PointerHoverEvent event) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;

    final size = box.size;
    if (size.isEmpty) return;

    setState(() {
      _pointer = Offset(
        (event.localPosition.dx / size.width) * 2 - 1,
        (event.localPosition.dy / size.height) * 2 - 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_reduceMotion) return widget.child;

    return MouseRegion(
      onEnter: (_) => _hover.forward(),
      onHover: _onHover,
      onExit: (_) {
        _hover.reverse();
        setState(() => _pointer = Offset.zero);
      },
      child: AnimatedBuilder(
        animation: _eased,
        builder: (context, child) {
          final t = _eased.value;
          final radians = widget.maxTilt * math.pi / 180;

          // A small perspective divisor: large enough to read as depth, small
          // enough that the card never looks like it is falling over.
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.0012)
            ..translate(0.0, -widget.hoverLift * t)
            ..rotateX(-_pointer.dy * radians * t)
            ..rotateY(_pointer.dx * radians * t)
            ..scale(1 + (widget.hoverScale - 1) * t);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            // `passthrough` hands the child the exact constraints TiltCard was
            // given. The default (`loose`) would strip the tight height that
            // an IntrinsicHeight/Expanded row relies on, leaving shorter cards
            // to shrink to their content instead of matching their neighbours.
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                child!,
                if (widget.glareColor != null && t > 0)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: ClipRRect(
                        borderRadius: widget.borderRadius,
                        child: CustomPaint(
                          painter: _GlarePainter(
                            pointer: _pointer,
                            color: widget.glareColor!,
                            opacity: t,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// Paints a soft radial highlight centred on the cursor, as if a light source
/// sat just above the pointer.
class _GlarePainter extends CustomPainter {
  final Offset pointer;
  final Color color;
  final double opacity;

  const _GlarePainter({
    required this.pointer,
    required this.color,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final center = Offset(
      (pointer.dx + 1) / 2 * size.width,
      (pointer.dy + 1) / 2 * size.height,
    );
    final radius = size.longestSide * 0.75;

    final paint = Paint()
      ..blendMode = BlendMode.plus
      ..shader = RadialGradient(
        colors: [
          color.withValues(alpha: color.a * opacity),
          color.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(_GlarePainter old) =>
      old.pointer != pointer || old.opacity != opacity || old.color != color;
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:resource/resource.dart';

import '../theme/brutal.dart';

/// Card neo-brutalism: viền mực dày + hard shadow, hover thì "nhấn" card
/// về phía shadow.
class BrutalCard extends StatefulWidget {
  final Widget child;
  final Color color;
  final double borderWidth;
  final Offset shadowOffset;
  final double radius;
  final EdgeInsets padding;

  /// Góc xoay tĩnh (độ) — vài độ lệch là chất brutal.
  final double rotationDegrees;
  final VoidCallback? onTap;
  final bool hoverEffect;

  const BrutalCard({
    super.key,
    required this.child,
    this.color = BrutalColors.paper,
    this.borderWidth = 3,
    this.shadowOffset = const Offset(6, 6),
    this.radius = 12,
    this.padding = const EdgeInsets.all(20),
    this.rotationDegrees = 0,
    this.onTap,
    this.hoverEffect = true,
  });

  @override
  State<BrutalCard> createState() => _BrutalCardState();
}

class _BrutalCardState extends State<BrutalCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final pressed = _hovered && widget.hoverEffect;
    final press = Offset(widget.shadowOffset.dx / 2, widget.shadowOffset.dy / 2);

    Widget card = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
            pressed ? press.dx : 0,
            pressed ? press.dy : 0,
            0,
          ),
          padding: widget.padding,
          decoration: BrutalDecoration.card(
            color: widget.color,
            borderWidth: widget.borderWidth,
            radius: widget.radius,
            shadowOffset: pressed ? widget.shadowOffset - press : widget.shadowOffset,
          ),
          child: widget.child,
        ),
      ),
    );

    if (widget.rotationDegrees != 0) {
      card = Transform.rotate(
        angle: widget.rotationDegrees * math.pi / 180,
        child: card,
      );
    }
    return card;
  }
}

/// Nút neo-brutalism: nền màu nổi, viền mực, hard shadow, nhấn thì lún xuống.
class BrutalButton extends StatefulWidget {
  final String label;
  final SvgGenImage? icon;
  final Color color;
  final Color textColor;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double fontSize;

  const BrutalButton({
    super.key,
    required this.label,
    this.icon,
    this.color = BrutalColors.yellow,
    this.textColor = BrutalColors.ink,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    this.fontSize = 15,
  });

  @override
  State<BrutalButton> createState() => _BrutalButtonState();
}

class _BrutalButtonState extends State<BrutalButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const shadow = Offset(4, 4);
    final enabled = widget.onPressed != null;
    final shift = !enabled
        ? Offset.zero
        : _pressed
            ? shadow
            : _hovered
                ? const Offset(2, 2)
                : Offset.zero;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onPressed != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(shift.dx, shift.dy, 0),
          padding: widget.padding,
          decoration: BrutalDecoration.card(
            color: widget.color,
            borderWidth: 2.5,
            radius: 10,
            shadowOffset: shadow - shift,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                widget.icon!.svg(
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(widget.textColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 10),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Chữ có khối highlight màu phía sau — thay cho gradient text.
class BrutalHighlight extends StatelessWidget {
  final Widget child;
  final Color color;
  final double rotationDegrees;
  final EdgeInsets padding;

  const BrutalHighlight({
    super.key,
    required this.child,
    this.color = BrutalColors.yellow,
    this.rotationDegrees = -1.2,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationDegrees * math.pi / 180,
      child: Container(
        padding: padding,
        decoration: BrutalDecoration.card(
          color: color,
          borderWidth: 3,
          radius: 8,
          shadowOffset: const Offset(5, 5),
        ),
        child: child,
      ),
    );
  }
}

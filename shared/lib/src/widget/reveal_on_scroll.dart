import 'package:flutter/material.dart';

/// Fades and lifts [child] into place the first time it scrolls into view, then
/// leaves it alone. Content that has already been read should not re-animate
/// when the reader scrolls back up.
///
/// Must be a descendant of a [Scrollable]. Outside one it simply shows [child],
/// which also keeps it safe in tests and golden files.
class RevealOnScroll extends StatefulWidget {
  final Widget child;

  /// Distance the child travels upward as it fades in.
  final double offset;

  /// Delay before this child starts, useful for staggering siblings.
  final Duration delay;

  final Duration duration;

  /// Fraction of the viewport height the widget's top edge must cross before
  /// the reveal fires. 0.85 means "once it is 15% up from the bottom".
  final double triggerFraction;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.offset = 42,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 620),
    this.triggerFraction = 0.85,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  ScrollPosition? _position;
  bool _revealed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (MediaQuery.disableAnimationsOf(context)) {
      _reveal();
      return;
    }

    final position = Scrollable.maybeOf(context)?.position;
    if (position != _position) {
      _position?.removeListener(_onScroll);
      _position = position;
      _position?.addListener(_onScroll);
    }

    if (_position == null) {
      _reveal();
    } else {
      // The first frame may already have us on screen, before any scroll.
      WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _reveal() {
    if (_revealed) return;
    _revealed = true;
    _position?.removeListener(_onScroll);

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  void _onScroll() {
    if (_revealed || !mounted) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize || !box.attached) return;

    final topEdge = box.localToGlobal(Offset.zero).dy;
    final threshold = MediaQuery.sizeOf(context).height * widget.triggerFraction;

    if (topEdge < threshold) _reveal();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeOutCubic.transform(_controller.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, widget.offset * (1 - t)),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

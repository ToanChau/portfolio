import 'package:flutter/material.dart';
import 'package:shared/src/theme/color/color.dart';

class ScaleTapWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? hoverColor;
  final double scaleHover;
  final double scaleTap;
  final Duration duration;

  ScaleTapWidget({
    required this.child,
    this.onTap,
    this.hoverColor=ColorPrimitive.cyan700 ,
    this.scaleHover = 1.05,
    this.scaleTap = 0.95,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<ScaleTapWidget> createState() => _ScaleTapWidgetState();
}

class _ScaleTapWidgetState extends State<ScaleTapWidget> with SingleTickerProviderStateMixin{
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color currentTextColor = DefaultTextStyle.of(context).style.color ?? Colors.black;

    final Color targetColor = (_isHovered && widget.hoverColor != null)
        ? widget.hoverColor!
        : currentTextColor;

    final double targetScale = _isPressed
        ? widget.scaleTap
        : (_isHovered ? widget.scaleHover : 1.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap?.call();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: targetScale,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: AnimatedDefaultTextStyle(
            duration: widget.duration,
            style: DefaultTextStyle.of(context).style.copyWith(color: targetColor),
            child: IconTheme(
              data: IconTheme.of(context).copyWith(color: targetColor),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/theme/color/color_primitive.dart';

class TextMaskVideo extends StatelessWidget {
  final Widget text;
  final bool isDark;
  final Duration? customDuration;
  final double? rotationAngle;

  const TextMaskVideo({
    super.key,
    required this.text,
    this.isDark = false,
    this.customDuration,
    this.rotationAngle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = isDark
        ? _getDarkColorScheme(context)
        : _getLightColorScheme(context);

    return GradientAnimationText(
      key: GlobalKey(),
      colors: colorScheme,
      text: text,
      duration: customDuration ?? Duration(seconds: isDark ? 6 : 5),
      transform: GradientRotation((rotationAngle ?? 60) * (math.pi / 180)),
      reverse: false,
    );
  }

  List<Color> _getLightColorScheme(BuildContext context) {
    return [
      ColorPrimitive.deepBlue600,
      const Color(0xFF2196F3),
      context.color.neutral.surface.active,
      const Color(0xFF00BCD4),
      const Color(0xFF37A2FF),
      const Color(0xFFFF6B9D),
      Colors.deepOrangeAccent,
      const Color(0xFFFFB74D),
      ColorPrimitive.deepBlue600,
    ];
  }

  List<Color> _getDarkColorScheme(BuildContext context) {
    return [
      const Color(0xFF0D47A1), // Xanh đậm
      const Color(0xFF1565C0), // Xanh đậm nhạt
      const Color(0xFF0288D1), // Xanh dương
      const Color(0xFF03A9F4), // Xanh dương sáng
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF26C6DA), // Cyan sáng
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF0288D1), // Xanh dương
      const Color(0xFF0D47A1), // Xanh đậm
    ];
  }
}

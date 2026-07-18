import 'package:flutter/material.dart';

/// Neo-brutalism design tokens: nền kem phẳng, viền mực dày, hard shadow lệch góc.
class BrutalColors {
  static const Color cream = Color(0xFFFFF8E7);
  static const Color paper = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF111111);
  static const Color inkSoft = Color(0xFF4A463E);

  static const Color yellow = Color(0xFFFFD23F);
  static const Color orange = Color(0xFFFF6B35);
  static const Color pink = Color(0xFFFF70A6);
  static const Color green = Color(0xFF06D6A0);
  static const Color blue = Color(0xFF4CC9F0);
  static const Color purple = Color(0xFF9B5DE5);
  static const Color red = Color(0xFFEF476F);
}

class BrutalDecoration {
  static BoxDecoration card({
    Color color = BrutalColors.paper,
    double borderWidth = 3,
    Offset shadowOffset = const Offset(6, 6),
    double radius = 12,
    Color shadowColor = BrutalColors.ink,
    Color borderColor = BrutalColors.ink,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(color: shadowColor, offset: shadowOffset, blurRadius: 0),
      ],
    );
  }

  static BoxDecoration chip({
    Color color = BrutalColors.paper,
    double borderWidth = 2,
    Offset shadowOffset = const Offset(3, 3),
    double radius = 8,
  }) =>
      card(
        color: color,
        borderWidth: borderWidth,
        shadowOffset: shadowOffset,
        radius: radius,
      );

  /// Chip phẳng không shadow — dùng khi nhiều chip đứng cạnh nhau trong Wrap.
  static BoxDecoration flatChip({
    Color color = BrutalColors.paper,
    double borderWidth = 2,
    double radius = 8,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: BrutalColors.ink, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}

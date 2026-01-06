import 'package:flutter/material.dart';

class TextUtil {
  static Size calculateTextSize(
    String text,
    TextStyle style, {
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.size;
  }

  static int calculateEffectiveLineCount({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required int maxLines,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      ellipsis: '…', // Optional: simulate ellipsis behavior
    )..layout(maxWidth: maxWidth);

    final lines = textPainter.computeLineMetrics();

    return lines.length;
  }
}

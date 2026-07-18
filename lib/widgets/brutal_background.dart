import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// Nền neo-brutalism: kem phẳng + lưới chấm mực + vài hình học màu nổi rải rác.
class BrutalBackground extends StatelessWidget {
  final Widget? child;

  const BrutalBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrutalColors.cream,
      child: CustomPaint(
        painter: _BrutalBackgroundPainter(),
        child: child,
      ),
    );
  }
}

class _BrutalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawDotGrid(canvas, size);
    _drawShapes(canvas, size);
  }

  void _drawDotGrid(Canvas canvas, Size size) {
    final paint = Paint()..color = BrutalColors.ink.withOpacity(0.08);
    const step = 32.0;
    for (double x = step / 2; x < size.width; x += step) {
      for (double y = step / 2; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.4, paint);
      }
    }
  }

  void _drawShapes(Canvas canvas, Size size) {
    // Vị trí theo tỉ lệ trang để hình rải đều dọc các section.
    final specs = [
      (_Shape.circle, const Offset(0.06, 0.08), 26.0, BrutalColors.yellow),
      (_Shape.cross, const Offset(0.94, 0.06), 20.0, BrutalColors.pink),
      (_Shape.square, const Offset(0.03, 0.30), 22.0, BrutalColors.blue),
      (_Shape.circle, const Offset(0.96, 0.34), 18.0, BrutalColors.green),
      (_Shape.cross, const Offset(0.05, 0.56), 18.0, BrutalColors.purple),
      (_Shape.square, const Offset(0.95, 0.60), 24.0, BrutalColors.orange),
      (_Shape.circle, const Offset(0.04, 0.82), 20.0, BrutalColors.pink),
      (_Shape.cross, const Offset(0.95, 0.86), 22.0, BrutalColors.yellow),
    ];

    final stroke = Paint()
      ..color = BrutalColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (final (shape, pos, radius, color) in specs) {
      final center = Offset(size.width * pos.dx, size.height * pos.dy);
      final fill = Paint()..color = color;
      switch (shape) {
        case _Shape.circle:
          canvas.drawCircle(center, radius, fill);
          canvas.drawCircle(center, radius, stroke);
        case _Shape.square:
          canvas.save();
          canvas.translate(center.dx, center.dy);
          canvas.rotate(12 * math.pi / 180);
          final rect = Rect.fromCenter(center: Offset.zero, width: radius * 2, height: radius * 2);
          canvas.drawRect(rect, fill);
          canvas.drawRect(rect, stroke);
          canvas.restore();
        case _Shape.cross:
          final cross = Paint()
            ..color = color
            ..style = PaintingStyle.stroke
            ..strokeWidth = 7
            ..strokeCap = StrokeCap.round;
          final outline = Paint()
            ..color = BrutalColors.ink
            ..style = PaintingStyle.stroke
            ..strokeWidth = 11
            ..strokeCap = StrokeCap.round;
          for (final p in [outline, cross]) {
            canvas.drawLine(center - Offset(radius, radius), center + Offset(radius, radius), p);
            canvas.drawLine(center - Offset(-radius, radius), center + Offset(-radius, radius), p);
          }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BrutalBackgroundPainter oldDelegate) => false;
}

enum _Shape { circle, square, cross }

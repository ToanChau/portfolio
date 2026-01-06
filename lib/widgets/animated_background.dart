import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// High-performance animated background with mesh gradient, glow orbs, and particles
class AnimatedBackground extends StatefulWidget {
  final Widget? child;
  final Color baseColor;
  final Color accentColor;
  final Color secondaryAccent;
  final bool enableSpotlight;
  final bool enableParticles;
  final bool enableGlowOrbs;
  final int particleCount;

  const AnimatedBackground({
    super.key,
    this.child,
    this.baseColor = const Color(0xFF151414),
    this.accentColor = const Color(0xFF06B6D4),
    this.secondaryAccent = const Color(0xFF37A2FF),
    this.enableSpotlight = true,
    this.enableParticles = true,
    this.enableGlowOrbs = true,
    this.particleCount = 10,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0;
  Offset _mousePosition = Offset.zero;
  Offset _smoothMousePosition = Offset.zero;
  late List<Particle> _particles;
  late List<GlowOrb> _glowOrbs;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initParticles();
    _initGlowOrbs();

    _ticker = createTicker((elapsed) {
      setState(() {
        _time = elapsed.inMilliseconds / 1000.0;
        _updateParticles();
        _updateGlowOrbs();
        // Smooth mouse follow
        _smoothMousePosition = Offset.lerp(
          _smoothMousePosition,
          _mousePosition,
          0.1,
        )!;
      });
    });
    _ticker.start();
  }

  void _initParticles() {
    _particles = List.generate(widget.particleCount, (index) {
      return Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 3 + 1,
        speed: _random.nextDouble() * 0.02 + 0.005,
        opacity: _random.nextDouble() * 0.5 + 0.2,
        type: ParticleType.values[_random.nextInt(ParticleType.values.length)],
      );
    });
  }

  void _initGlowOrbs() {
    _glowOrbs = [
      GlowOrb(
        x: 0.1, y: 0.1,
        radius: 0.2,
        color: widget.accentColor.withOpacity(0.08),
        speedX: 0.1, speedY: 0.15,
        phaseOffset: 0,
      ),
      GlowOrb(
        x: 0.9, y: 0.1,
        radius: 0.2,
        color: widget.secondaryAccent.withOpacity(0.05),
        speedX: 0.12, speedY: 0.1,
        phaseOffset: 2,
      ),
      GlowOrb(
        x: 0.2, y: 0.9,
        radius: 0.1,
        color: widget.secondaryAccent.withOpacity(0.07),
        speedX: 0.08, speedY: 0.12,
        phaseOffset: 4,
      ),
      GlowOrb(
        x: 0.9, y: 0.9,
        radius: 0.25,
        color: widget.accentColor.withOpacity(0.05),
        speedX: 0.15, speedY: 0.08,
        phaseOffset: 1,
      ),
    ];
  }

  void _updateParticles() {
    for (var particle in _particles) {
      particle.y -= particle.speed;
      if (particle.y < -0.1) {
        particle.y = 1.1;
        particle.x = _random.nextDouble();
      }
    }
  }

  void _updateGlowOrbs() {
    for (var orb in _glowOrbs) {
      orb.currentX = orb.x + sin(_time * orb.speedX + orb.phaseOffset) * 0.05;
      orb.currentY = orb.y + cos(_time * orb.speedY + orb.phaseOffset) * 0.05;
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: widget.enableSpotlight
          ? (event) {
        final size = MediaQuery.of(context).size;
        _mousePosition = Offset(
          event.position.dx / size.width,
          event.position.dy / size.height,
        );
      }
          : null,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: BackgroundPainter(
            time: _time,
            mousePosition: _smoothMousePosition,
            particles: widget.enableParticles ? _particles : [],
            glowOrbs: widget.enableGlowOrbs ? _glowOrbs : [],
            baseColor: widget.baseColor,
            accentColor: widget.accentColor,
            secondaryAccent: widget.secondaryAccent,
            enableSpotlight: widget.enableSpotlight,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}


enum ParticleType { dot, glow, line }

class Particle {
  double x;
  double y;
  final double size;
  final double speed;
  final double opacity;
  final ParticleType type;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
    required this.type,
  });
}

class GlowOrb {
  final double x;
  final double y;
  double currentX;
  double currentY;
  final double radius;
  final Color color;
  final double speedX;
  final double speedY;
  final double phaseOffset;

  GlowOrb({
    required this.x,
    required this.y,
    required this.radius,
    required this.color,
    required this.speedX,
    required this.speedY,
    required this.phaseOffset,
  })  : currentX = x,
        currentY = y;
}


class BackgroundPainter extends CustomPainter {
  final double time;
  final Offset mousePosition;
  final List<Particle> particles;
  final List<GlowOrb> glowOrbs;
  final Color baseColor;
  final Color accentColor;
  final Color secondaryAccent;
  final bool enableSpotlight;

  BackgroundPainter({
    required this.time,
    required this.mousePosition,
    required this.particles,
    required this.glowOrbs,
    required this.baseColor,
    required this.accentColor,
    required this.secondaryAccent,
    required this.enableSpotlight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBaseGradient(canvas, size);
    _drawMeshGradient(canvas, size);
    _drawGlowOrbs(canvas, size);
    _drawGrid(canvas, size);
    if (enableSpotlight) {
      _drawSpotlight(canvas, size);
    }

    _drawParticles(canvas, size);
  }

  void _drawBaseGradient(Canvas canvas, Size size) {
    final paint = Paint()
     ..color = baseColor;
    canvas.drawRect(Offset.zero & size, paint);
  }

  void _drawMeshGradient(Canvas canvas, Size size) {
    // Animated mesh positions
    final offset1 = sin(time * 0.3) * 0.02;
    final offset2 = cos(time * 0.25) * 0.02;

    final gradients = [
      _MeshGradientConfig(
        center: Offset(0.2 + offset1, 0.1 + offset2),
        radius: 0.5,
        color: accentColor.withOpacity(0.3),
      ),
      _MeshGradientConfig(
        center: Offset(0.8 - offset1, 0.15 + offset2),
        radius: 0.4,
        color: secondaryAccent.withOpacity(0.15),
      ),
      _MeshGradientConfig(
        center: Offset(0.9 + offset2, 0.9 - offset1),
        radius: 0.35,
        color: secondaryAccent.withOpacity(0.15),
      ),
      _MeshGradientConfig(
        center: Offset(0.1 - offset2, 0.8 + offset1),
        radius: 0.3,
        color: accentColor.withOpacity(0.1),
      ),
    ];

    for (final config in gradients) {
      final paint = Paint()
        ..shader = ui.Gradient.radial(
          Offset(size.width * config.center.dx, size.height * config.center.dy),
          size.width * config.radius,
          [
            config.color.withOpacity(0.01),
            config.color.withOpacity(0.001),
          ],
          [0.0, 1.0],
        )
        ..blendMode = BlendMode.plus;

      canvas.drawRect(Offset.zero & size, paint);
    }
  }

  void _drawGlowOrbs(Canvas canvas, Size size) {
    for (final orb in glowOrbs) {
      final center = Offset(
        size.width * orb.currentX,
        size.height * orb.currentY,
      );

      final paint = Paint()
        ..shader = ui.Gradient.radial(
          center,
          size.width * orb.radius,
          [
            orb.color,
            orb.color.withOpacity(0),
          ],
          [0.0, 1.0],
        )
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

      canvas.drawCircle(center, size.width * orb.radius, paint);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = accentColor.withOpacity(0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const gridSize = 50.0;

    // Create mask gradient for grid fade
    final maskCenter = Offset(size.width * 0.5, size.height * 0.3);
    final maskRadius = size.width * 0.6;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      final distFromCenter = (x - maskCenter.dx).abs() / maskRadius;
      if (distFromCenter < 1) {
        gridPaint.color = accentColor.withOpacity(0.03 * (1 - distFromCenter));
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
      }
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      final distFromCenter = (y - maskCenter.dy).abs() / maskRadius;
      if (distFromCenter < 1) {
        gridPaint.color = accentColor.withOpacity(0.03 * (1 - distFromCenter));
        canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
      }
    }
  }

  void _drawSpotlight(Canvas canvas, Size size) {
    if (mousePosition == Offset.zero) return;

    final center = Offset(
      size.width * mousePosition.dx,
      size.height * mousePosition.dy,
    );

    final paint = Paint()
      ..shader = ui.Gradient.radial(
        center,
        size.width * 0.4,
        [
          accentColor.withOpacity(0.18),
          accentColor.withOpacity(0.15),
        ],
        [0.0, 1.0],
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  void _drawParticles(Canvas canvas, Size size) {
    for (final particle in particles) {
      final position = Offset(
        size.width * particle.x,
        size.height * particle.y,
      );

      switch (particle.type) {
        case ParticleType.dot:
          _drawDotParticle(canvas, position, particle);
          break;
        case ParticleType.glow:
          _drawGlowParticle(canvas, position, particle);
          break;
        case ParticleType.line:
          _drawLineParticle(canvas, position, particle);
          break;
      }
    }
  }

  void _drawDotParticle(Canvas canvas, Offset position, Particle particle) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(particle.opacity * 0.6)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, particle.size, paint);
  }

  void _drawGlowParticle(Canvas canvas, Offset position, Particle particle) {
    final paint = Paint()
      ..color = accentColor.withOpacity(particle.opacity)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    canvas.drawCircle(position, particle.size * 1.5, paint);
  }

  void _drawLineParticle(Canvas canvas, Offset position, Particle particle) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        position.translate(0, -10),
        position.translate(0, 10),
        [
          Colors.transparent,
          Colors.grey.withOpacity(particle.opacity * 0.5),
          Colors.transparent,
        ],
        [0.0, 0.5, 1.0],
      )
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      position.translate(0, -10),
      position.translate(0, 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) {
    return oldDelegate.time != time ||
        oldDelegate.mousePosition != mousePosition;
  }
}

class _MeshGradientConfig {
  final Offset center;
  final double radius;
  final Color color;

  _MeshGradientConfig({
    required this.center,
    required this.radius,
    required this.color,
  });
}

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:resource/resource.dart';

class AboutHero extends StatefulWidget {
  final String imagePath;
  final List<FloatingCardData> floatingCards;
  final double size;

  const AboutHero({super.key, required this.imagePath, required this.floatingCards, this.size = 500});

  @override
  State<AboutHero> createState() => _AboutHeroState();
}

class _AboutHeroState extends State<AboutHero> with TickerProviderStateMixin {
  late AnimationController _ringController;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _ringController = AnimationController(duration: const Duration(seconds: 8), vsync: this)..repeat();

    _floatController = AnimationController(duration: const Duration(seconds: 3), vsync: this)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ringController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size + 100,
      height: widget.size + 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _ringController,
            builder: (context, child) {
              return CustomPaint(
                size: Size(widget.size + 40, widget.size + 40),
                painter: _RingsPainter(
                  rotation: _ringController.value * 2 * math.pi,
                  gradientColors: const [Color(0xFF06B6D4), Color(0xFF14B8A6), Color(0xFF38BDF8)],
                ),
              );
            },
          ),

          // Profile Image
          Container(
            width: widget.size - 40,
            height: widget.size - 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF272C35),
              image: DecorationImage(image: AssetImage(widget.imagePath), fit: BoxFit.fitHeight),
            ),
          ),

          // Floating Cards
          ...widget.floatingCards.asMap().entries.map((entry) {
            final index = entry.key;
            final card = entry.value;
            return _FloatingCard(data: card, animation: _floatController, delay: index * 0.33);
          }),
        ],
      ),
    );
  }
}

/// CustomPainter cho vòng tròn gradient
class _RingsPainter extends CustomPainter {
  final double rotation;
  final List<Color> gradientColors;

  _RingsPainter({required this.rotation, required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    _drawDashedRing(canvas, center, radius + 10, rotation * -0.4);
    _drawGradientRing(canvas, center, radius - 10, rotation);
  }

  void _drawGradientRing(Canvas canvas, Offset center, double radius, double rot) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      startAngle: rot,
      endAngle: rot + 2 * math.pi,
      colors: [...gradientColors, gradientColors.first],
      stops: const [0.0, 0.33, 0.66, 1.0],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius, paint);
  }

  void _drawDashedRing(Canvas canvas, Offset center, double radius, double rot) {
    final paint = Paint()
      ..color = const Color(0xFF414651)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    const dashCount = 180;
    for (int i = 0; i < dashCount; i++) {
      final startAngle = rot + (i * 0.01 * 2 * math.pi);
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, 0.005 * 2 * math.pi, false, paint);
    }
  }

  @override
  bool shouldRepaint(_RingsPainter old) => old.rotation != rotation;
}

/// Data class cho floating card
class FloatingCardData {
  final SvgGenImage icon;
  final String title;
  final String? subtitle;
  final String? backTitle;
  final String? backSubtitle;
  final FloatingPosition position;
  final Color? backgroundColor;
  final Color? iconColor;

  const FloatingCardData({
    required this.icon,
    required this.title,
    this.subtitle,
    this.backTitle,
    this.backSubtitle,
    required this.position,
    this.backgroundColor,
    this.iconColor,
  });
}

/// Vị trí của floating card
class FloatingPosition {
  final double top;
  final double left;
  final double right;
  final double bottom;

  const FloatingPosition({
    this.top = double.infinity,
    this.left = double.infinity,
    this.right = double.infinity,
    this.bottom = double.infinity,
  });

  factory FloatingPosition.topLeft(double top, double left) => FloatingPosition(top: top, left: left);

  factory FloatingPosition.topRight(double top, double right) => FloatingPosition(top: top, right: right);

  factory FloatingPosition.bottomLeft(double bottom, double left) => FloatingPosition(bottom: bottom, left: left);

  factory FloatingPosition.bottomRight(double bottom, double right) => FloatingPosition(bottom: bottom, right: right);
}

/// Floating Card với drag, flip và spring-back animation
class _FloatingCard extends StatefulWidget {
  final FloatingCardData data;
  final Animation<double> animation;
  final double delay;

  const _FloatingCard({required this.data, required this.animation, required this.delay});

  @override
  State<_FloatingCard> createState() => _FloatingCardState();
}

class _FloatingCardState extends State<_FloatingCard> with TickerProviderStateMixin {
  // Drag state
  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;

  // Spring-back animation
  late AnimationController _springController;
  late Animation<Offset> _springAnimation;
  Offset _dragStartOffset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _springController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
  }

  @override
  void dispose() {
    _springController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
      _dragStartOffset = _dragOffset;
    });
    _springController.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() => _isDragging = false);

    _springAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _springController, curve: Curves.elasticOut));

    _springController.forward(from: 0).then((_) {
      if (mounted) {
        setState(() => _dragOffset = Offset.zero);
      }
    });

    _springController.addListener(_onSpringUpdate);
  }

  void _onSpringUpdate() {
    if (mounted && _springAnimation.value != _dragOffset) {
      setState(() => _dragOffset = _springAnimation.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pos = widget.data.position;

    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        // Bounce animation với delay
        final bounceValue = math.sin((widget.animation.value + widget.delay) * 2 * math.pi) * 8;
        return Positioned(
          top: pos.top != double.infinity ? pos.top + bounceValue + _dragOffset.dy : null,
          left: pos.left != double.infinity ? pos.left + _dragOffset.dx : null,
          right: pos.right != double.infinity ? pos.right - _dragOffset.dx : null,
          bottom: pos.bottom != double.infinity ? pos.bottom - bounceValue - _dragOffset.dy : null,
          child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: AnimatedScale(
              scale: _isDragging ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 150),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: widget.data.backgroundColor ?? const Color(0xFF1E2128),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isDragging ? const Color(0xFF06B6D4) : const Color(0xFF414651),
                    width: _isDragging ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isDragging ? const Color(0xFF06B6D4).withOpacity(0.3) : Colors.black.withOpacity(0.2),
                      blurRadius: _isDragging ? 50 : 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: _buildFrontCard(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFrontCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.data.icon.svg(height: 20, width: 20),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            if (widget.data.subtitle != null)
              Text(widget.data.subtitle!, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class GradientAnimationText extends StatefulWidget {
  final Widget text;
  final List<Color> colors;
  final Duration duration;
  final bool? reverse;
  final GradientTransform? transform;

  const GradientAnimationText({
    required this.text,
    required this.colors,
    required this.duration,
    this.reverse,
    this.transform,
    super.key,
  });

  @override
  State<GradientAnimationText> createState() => _GradientAnimationTextState();
}

class _GradientAnimationTextState extends State<GradientAnimationText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late List<Color> colors;
  late int n;
  late double diff;
  late Widget text;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animationController.repeat(reverse: widget.reverse ?? false);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    colors = [];
    colors.add(widget.colors.last);
    colors.addAll(widget.colors);
    colors.addAll(widget.colors);

    n = widget.colors.length;

    // diff
    diff = (1 / n);
  }

  List<double> stopsList() {
    int multiplier = -1 * n;
    List<double> stops = [];

    while (multiplier <= n) {
      stops.add(_animation.value + (multiplier * diff));
      multiplier++;
    }

    return stops;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: widget.text,
      shaderCallback: (rect) {
        return LinearGradient(
          tileMode: TileMode.clamp,
          transform: widget.transform,
          stops: stopsList(),
          colors: colors,
        ).createShader(rect);
      },
    );
  }
}

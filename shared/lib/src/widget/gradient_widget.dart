import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final Gradient gradient;
  final Widget child;

  const GradientWidget({
    super.key,
    required this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: child,
    );
  }
}

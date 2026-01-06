import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ResponsiveValue<T> {
  final T desktop;
  final T tablet;
  final T mobile;

  const ResponsiveValue({
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  T of(BuildContext context) {
    if (context.isMobileBreakPoint) return mobile;
    if (context.isTabletBreakPoint) return tablet;
    return desktop;
  }
}

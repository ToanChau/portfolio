import 'package:flutter/material.dart';
import '../responsive_value.dart';

extension AppFontSizeExtension on BuildContext {
  _AppFontSize get fontSize => _AppFontSize(this);
}

class _AppFontSize {
  final BuildContext context;

  const _AppFontSize(this.context);

  double get h1 => _AppFontSizeValue.h1.of(context);

  double get h2 => _AppFontSizeValue.h2.of(context);

  double get h3 => _AppFontSizeValue.h3.of(context);

  double get h4 => _AppFontSizeValue.h4.of(context);

  double get h5 => _AppFontSizeValue.h5.of(context);

  double get h6 => _AppFontSizeValue.h6.of(context);

  double get p1 => _AppFontSizeValue.p1.of(context);

  double get p2 => _AppFontSizeValue.p2.of(context);

  double get c1 => _AppFontSizeValue.c1.of(context);

  double get c2 => _AppFontSizeValue.c2.of(context);
}

class _AppFontSizeValue {
  static const ResponsiveValue<double> h1 = ResponsiveValue(
    desktop: 144,
    tablet: 72,
    mobile: 48,
  );

  static const ResponsiveValue<double> h2 = ResponsiveValue(
    desktop: 72,
    tablet: 48,
    mobile: 32,
  );

  static const ResponsiveValue<double> h3 = ResponsiveValue(
    desktop: 48,
    tablet: 32,
    mobile: 24,
  );

  static const ResponsiveValue<double> h4 = ResponsiveValue(
    desktop: 32,
    tablet: 24,
    mobile: 20,
  );

  static const ResponsiveValue<double> h5 = ResponsiveValue(
    desktop: 24,
    tablet: 20,
    mobile: 16,
  );

  static const ResponsiveValue<double> h6 = ResponsiveValue(
    desktop: 20,
    tablet: 16,
    mobile: 14,
  );

  static const ResponsiveValue<double> p1 = ResponsiveValue(
    desktop: 16,
    tablet: 16,
    mobile: 16,
  );

  static const ResponsiveValue<double> p2 = ResponsiveValue(
    desktop: 14,
    tablet: 14,
    mobile: 14,
  );

  static const ResponsiveValue<double> c1 = ResponsiveValue(
    desktop: 12,
    tablet: 12,
    mobile: 12,
  );

  static const ResponsiveValue<double> c2 = ResponsiveValue(
    desktop: 10,
    tablet: 10,
    mobile: 10,
  );
}

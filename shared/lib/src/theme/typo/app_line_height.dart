import 'package:flutter/material.dart';
import '../responsive_value.dart';

extension AppLineHeightExtension on BuildContext {
  _AppLineHeight get lineHeight => _AppLineHeight(this);
}

class _AppLineHeight {
  final BuildContext context;

  const _AppLineHeight(this.context);

  double get h1 => _AppLineHeightValue.h1.of(context);

  double get h2 => _AppLineHeightValue.h2.of(context);

  double get h3 => _AppLineHeightValue.h3.of(context);

  double get h4 => _AppLineHeightValue.h4.of(context);

  double get h5 => _AppLineHeightValue.h5.of(context);

  double get h6 => _AppLineHeightValue.h6.of(context);

  double get p1 => _AppLineHeightValue.p1.of(context);

  double get p2 => _AppLineHeightValue.p2.of(context);

  double get c1 => _AppLineHeightValue.c1.of(context);

  double get c2 => _AppLineHeightValue.c2.of(context);
}

class _AppLineHeightValue {
  static const ResponsiveValue<double> h1 = ResponsiveValue(
    desktop: 172,
    tablet: 80,
    mobile: 56,
  );

  static const ResponsiveValue<double> h2 = ResponsiveValue(
    desktop: 80,
    tablet: 56,
    mobile: 40,
  );

  static const ResponsiveValue<double> h3 = ResponsiveValue(
    desktop: 56,
    tablet: 40,
    mobile: 32,
  );

  static const ResponsiveValue<double> h4 = ResponsiveValue(
    desktop: 40,
    tablet: 32,
    mobile: 28,
  );

  static const ResponsiveValue<double> h5 = ResponsiveValue(
    desktop: 32,
    tablet: 28,
    mobile: 24,
  );

  static const ResponsiveValue<double> h6 = ResponsiveValue(
    desktop: 28,
    tablet: 24,
    mobile: 20,
  );

  static const ResponsiveValue<double> p1 = ResponsiveValue(
    desktop: 24,
    tablet: 24,
    mobile: 24,
  );

  static const ResponsiveValue<double> p2 = ResponsiveValue(
    desktop: 20,
    tablet: 20,
    mobile: 20,
  );

  static const ResponsiveValue<double> c1 = ResponsiveValue(
    desktop: 18,
    tablet: 18,
    mobile: 18,
  );

  static const ResponsiveValue<double> c2 = ResponsiveValue(
    desktop: 16,
    tablet: 16,
    mobile: 16,
  );
}

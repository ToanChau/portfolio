import 'responsive_value.dart';
import 'package:flutter/material.dart';

extension GapContextExtension on BuildContext {
  double get gap06_04_02 => AppGap.gap06_04_02.of(this);

  double get gap12_04_04 => AppGap.gap12_04_04.of(this);

  double get gap12_12_12 => AppGap.gap12_12_12.of(this);

  double get gap24_16_12 => AppGap.gap24_16_12.of(this);

  double get gap24_04_04 => AppGap.gap24_04_04.of(this);

  double get gap48_40_24 => AppGap.gap48_40_24.of(this);

  double get gap80_64_40 => AppGap.gap80_64_40.of(this);

  double get gap128_96_80 => AppGap.gap128_96_80.of(this);
}

class AppGap {
  static const ResponsiveValue<double> gap06_04_02 = ResponsiveValue<double>(
    desktop: 6,
    tablet: 4,
    mobile: 2,
  );

  static const ResponsiveValue<double> gap12_04_04 = ResponsiveValue<double>(
    desktop: 12,
    tablet: 4,
    mobile: 4,
  );

  static const ResponsiveValue<double> gap12_12_12 = ResponsiveValue<double>(
    desktop: 12,
    tablet: 12,
    mobile: 12,
  );

  static const ResponsiveValue<double> gap24_16_12 = ResponsiveValue<double>(
    desktop: 24,
    tablet: 16,
    mobile: 12,
  );

  static const ResponsiveValue<double> gap24_04_04 = ResponsiveValue<double>(
    desktop: 24,
    tablet: 4,
    mobile: 4,
  );

  static const ResponsiveValue<double> gap48_40_24 = ResponsiveValue<double>(
    desktop: 48,
    tablet: 40,
    mobile: 24,
  );

  static const ResponsiveValue<double> gap80_64_40 = ResponsiveValue<double>(
    desktop: 80,
    tablet: 64,
    mobile: 40,
  );

  static const ResponsiveValue<double> gap128_96_80 = ResponsiveValue<double>(
    desktop: 128,
    tablet: 96,
    mobile: 80,
  );
}

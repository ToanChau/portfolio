import 'responsive_value.dart';
import 'package:flutter/material.dart';

extension PaddingContextExtension on BuildContext {
  double get paddingGridLR => AppPadding.gridLR.of(this);

  double get paddingGridTB => AppPadding.gridTB.of(this);

  double get padding06_04_02 => AppPadding.p06_04_02.of(this);

  double get padding12_06_02 => AppPadding.p12_06_02.of(this);

  double get padding12_12_06 => AppPadding.p12_12_06.of(this);

  double get padding16_08_04 => AppPadding.p16_08_04.of(this);

  double get padding16_16_12 => AppPadding.p16_16_12.of(this);

  double get padding20_12_08 => AppPadding.p20_12_08.of(this);

  double get padding24_16_12 => AppPadding.p24_16_12.of(this);

  double get padding28_14_10 => AppPadding.p28_14_10.of(this);

  double get padding32_16_12 => AppPadding.p32_16_12.of(this);

  double get padding48_32_24 => AppPadding.p48_32_24.of(this);

  double get padding80_48_20 => AppPadding.p80_48_20.of(this);

  double get padding80_64_40 => AppPadding.p80_64_40.of(this);

  double get padding128_32_16 => AppPadding.p128_32_16.of(this);

  double get padding128_80_64 => AppPadding.p128_80_64.of(this);

  double get padding256_32_16 => AppPadding.p256_32_16.of(this);
}

class AppPadding {
  static const ResponsiveValue<double> gridLR = ResponsiveValue<double>(
    desktop: 128,
    tablet: 32,
    mobile: 16,
  );

  static const ResponsiveValue<double> gridTB = ResponsiveValue<double>(
    desktop: 32,
    tablet: 24,
    mobile: 12,
  );

  static const ResponsiveValue<double> p06_04_02 = ResponsiveValue<double>(
    desktop: 6,
    tablet: 4,
    mobile: 2,
  );

  static const ResponsiveValue<double> p12_06_02 = ResponsiveValue<double>(
    desktop: 12,
    tablet: 6,
    mobile: 2,
  );

  static const ResponsiveValue<double> p12_12_06 = ResponsiveValue<double>(
    desktop: 12,
    tablet: 12,
    mobile: 6,
  );

  static const ResponsiveValue<double> p16_08_04 = ResponsiveValue<double>(
    desktop: 16,
    tablet: 8,
    mobile: 4,
  );

  static const ResponsiveValue<double> p16_16_12 = ResponsiveValue<double>(
    desktop: 16,
    tablet: 16,
    mobile: 12,
  );

  static const ResponsiveValue<double> p20_12_08 = ResponsiveValue<double>(
    desktop: 20,
    tablet: 12,
    mobile: 8,
  );

  static const ResponsiveValue<double> p24_16_12 = ResponsiveValue<double>(
    desktop: 24,
    tablet: 16,
    mobile: 12,
  );

  static const ResponsiveValue<double> p28_14_10 = ResponsiveValue<double>(
    desktop: 28,
    tablet: 14,
    mobile: 10,
  );

  static const ResponsiveValue<double> p32_16_12 = ResponsiveValue<double>(
    desktop: 32,
    tablet: 16,
    mobile: 12,
  );

  static const ResponsiveValue<double> p48_32_24 = ResponsiveValue<double>(
    desktop: 48,
    tablet: 32,
    mobile: 24,
  );

  static const ResponsiveValue<double> p80_48_20 = ResponsiveValue<double>(
    desktop: 80,
    tablet: 48,
    mobile: 20,
  );

  static const ResponsiveValue<double> p80_64_40 = ResponsiveValue<double>(
    desktop: 80,
    tablet: 64,
    mobile: 40,
  );

  static const ResponsiveValue<double> p128_32_16 = ResponsiveValue<double>(
    desktop: 128,
    tablet: 32,
    mobile: 16,
  );

  static const ResponsiveValue<double> p128_80_64 = ResponsiveValue<double>(
    desktop: 128,
    tablet: 80,
    mobile: 64,
  );

  static const ResponsiveValue<double> p256_32_16 =
      ResponsiveValue(desktop: 256, tablet: 32, mobile: 16);
}

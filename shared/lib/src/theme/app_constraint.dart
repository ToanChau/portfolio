import 'package:flutter/material.dart';
import 'responsive_value.dart';

extension ConstraintContextExtension on BuildContext {
  double get screenSize => AppConstraint.screenSize.of(this);

  double get w178_82_81 => AppConstraint.w178_82_81.of(this);

  double get w178_672_358 => AppConstraint.w178_672_358.of(this);

  double get w279_182_174 => AppConstraint.w279_182_174.of(this);

  double get w277_182_174 => AppConstraint.w277_182_174.of(this);

  double get w379_182_174 => AppConstraint.w379_182_174.of(this);

  double get w379_279_358 => AppConstraint.w379_278_358.of(this);

  double get w379_378_358 => AppConstraint.w379_378_358.of(this);

  double get w580_378_174 => AppConstraint.w580_378_174.of(this);

  double get w580_380_359 => AppConstraint.w580_380_359.of(this);

  double get w680_377_358 => AppConstraint.w680_377_358.of(this);

  double get w781_574_358 => AppConstraint.w781_574_358.of(this);

  double get w820_472_218 => AppConstraint.w820_472_218.of(this);

  double get w983_672_358 => AppConstraint.w983_672_358.of(this);

  double get w1184_770_358 => AppConstraint.w1184_770_358.of(this);
}

class AppConstraint {
  static const ResponsiveValue<double> screenSize = ResponsiveValue<double>(
    desktop: 1440,
    tablet: 834,
    mobile: 390,
  );

  static const ResponsiveValue<double> w178_82_81 = ResponsiveValue<double>(
    desktop: 178,
    tablet: 82,
    mobile: 81,
  );
  static const ResponsiveValue<double> w178_672_358 = ResponsiveValue<double>(
      desktop: 178,
      tablet: 672,
      mobile: 358
  );

  static const ResponsiveValue<double> w279_182_174 = ResponsiveValue<double>(
    desktop: 279,
    tablet: 182,
    mobile: 174,
  );

  static const ResponsiveValue<double> w277_182_174 = ResponsiveValue<double>(
      desktop: 277,
      tablet: 182,
      mobile: 174
  );

  static const ResponsiveValue<double> w277_181_182 = ResponsiveValue<double>(
      desktop: 277,
      tablet: 181,
      mobile: 182
  );

  static const ResponsiveValue<double> w379_182_174 = ResponsiveValue<double>(
    desktop: 379,
    tablet: 182,
    mobile: 174,
  );

  static const ResponsiveValue<double> w379_278_358 = ResponsiveValue<double>(
    desktop: 379,
    tablet: 279,
    mobile: 358,
  );

  static const ResponsiveValue<double> w379_378_358 = ResponsiveValue<double>(
    desktop: 379,
    tablet: 378,
    mobile: 358,
  );
  static const ResponsiveValue<double> w580_378_174 = ResponsiveValue<double>(
    desktop: 580,
    tablet: 378,
    mobile: 174,
  );

  static const ResponsiveValue<double> w580_380_359 = ResponsiveValue<double>(
    desktop: 580,
    tablet: 380,
    mobile: 359,
  );

  static const ResponsiveValue<double> w680_377_358 = ResponsiveValue<double>(
    desktop: 680,
    tablet: 377,
    mobile: 358,
  );

  static const ResponsiveValue<double> w781_574_358 = ResponsiveValue<double>(
    desktop: 781,
    tablet: 574,
    mobile: 358,
  );

  static const ResponsiveValue<double> w820_472_218 = ResponsiveValue<double>(
    desktop: 820,
    tablet: 472,
    mobile: 218,
  );

  static const ResponsiveValue<double> w983_672_358 = ResponsiveValue<double>(
    desktop: 983,
    tablet: 672,
    mobile: 358,
  );


  static const ResponsiveValue<double> w1184_770_358 = ResponsiveValue<double>(
    desktop: 1184,
    tablet: 770,
    mobile: 358,
  );
}

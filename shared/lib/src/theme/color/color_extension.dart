import 'package:flutter/material.dart';

import 'color_token.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final ColorToken neutral;
  final ColorToken brand;
  final ColorToken subBrand;
  final ColorToken accent;
  final ColorToken error;
  final ColorToken warning;
  final ColorToken success;
  final ColorToken info;

  AppColorsExtension(
      {required this.neutral,
      required this.brand,
      required this.subBrand,
      required this.accent,
      required this.error,
      required this.warning,
      required this.success,
      required this.info});

  @override
  ThemeExtension<AppColorsExtension> copyWith(
      {ColorToken? neutral,
      ColorToken? brand,
      ColorToken? subBrand,
      ColorToken? accent,
      ColorToken? error,
      ColorToken? warning,
      ColorToken? success,
      ColorToken? info}) {
    return AppColorsExtension(
        neutral: neutral ?? this.neutral,
        brand: brand ?? this.brand,
        subBrand: subBrand ?? this.subBrand,
        accent: accent ?? this.accent,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        success: error ?? this.success,
        info: info ?? this.info);
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return this;
  }
}

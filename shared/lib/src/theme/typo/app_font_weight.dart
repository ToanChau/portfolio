import 'package:flutter/material.dart';

import '../responsive_value.dart';

extension AppFontWeightExtension on BuildContext {
  _AppFontWeight get fontWeight => _AppFontWeight(this);
}

class _AppFontWeight {
  final BuildContext context;

  const _AppFontWeight(this.context);

  FontWeight get light => _AppFontWeightValue.light.of(context);

  FontWeight get regular => _AppFontWeightValue.regular.of(context);

  FontWeight get medium => _AppFontWeightValue.medium.of(context);

  FontWeight get semibold => _AppFontWeightValue.semibold.of(context);
}

class _AppFontWeightValue {
  static const ResponsiveValue<FontWeight> light = ResponsiveValue<FontWeight>(
    desktop: FontWeight.w300,
    tablet: FontWeight.w300,
    mobile: FontWeight.w300,
  );

  static const ResponsiveValue<FontWeight> regular =
      ResponsiveValue<FontWeight>(
    desktop: FontWeight.w400,
    tablet: FontWeight.w400,
    mobile: FontWeight.w400,
  );

  static const ResponsiveValue<FontWeight> medium = ResponsiveValue<FontWeight>(
    desktop: FontWeight.w500,
    tablet: FontWeight.w500,
    mobile: FontWeight.w500,
  );

  static const ResponsiveValue<FontWeight> semibold =
      ResponsiveValue<FontWeight>(
    desktop: FontWeight.w600,
    tablet: FontWeight.w600,
    mobile: FontWeight.w600,
  );
}

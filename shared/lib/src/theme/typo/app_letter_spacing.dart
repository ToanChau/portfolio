import 'package:flutter/material.dart';

import '../responsive_value.dart';

extension AppLetterSpacingExtension on BuildContext {
  _AppLetterSpacing get letterSpacing => _AppLetterSpacing(this);
}

class _AppLetterSpacing {
  final BuildContext context;

  const _AppLetterSpacing(this.context);

  double get moreNarrow => _AppLetterSpacingValue.moreNarrow.of(context);

  double get narrow => _AppLetterSpacingValue.narrow.of(context);

  double get normal => _AppLetterSpacingValue.normal.of(context);

  double get wide => _AppLetterSpacingValue.wide.of(context);
}

class _AppLetterSpacingValue {
  static const ResponsiveValue<double> moreNarrow = ResponsiveValue<double>(
    desktop: -1.3,
    tablet: -1.3,
    mobile: -1.3,
  );

  static const ResponsiveValue<double> narrow = ResponsiveValue<double>(
    desktop: -0.6,
    tablet: -0.6,
    mobile: -0.6,
  );

  static const ResponsiveValue<double> normal = ResponsiveValue<double>(
    desktop: 0.0,
    tablet: 0.0,
    mobile: 0.0,
  );

  static const ResponsiveValue<double> wide = ResponsiveValue<double>(
    desktop: 0.3,
    tablet: 0.3,
    mobile: 0.3,
  );
}

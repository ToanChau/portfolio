import 'responsive_value.dart';
import 'package:flutter/material.dart';

extension RadiusContextExtension on BuildContext {
  BorderRadius get radiusXs => AppRadius.xs.of(this);

  BorderRadius get radiusSm => AppRadius.sm.of(this);

  BorderRadius get radiusSm2 => AppRadius.sm2.of(this);

  BorderRadius get radiusMd => AppRadius.md.of(this);

  BorderRadius get radiusLg => AppRadius.lg.of(this);

  BorderRadius get radiusXl => AppRadius.xl.of(this);

  BorderRadius get radius2xl => AppRadius.xl2.of(this);

  BorderRadius get radius3xl => AppRadius.xl3.of(this);

  BorderRadius get radius4xl => AppRadius.xl4.of(this);

  BorderRadius get radius5xl => AppRadius.xl5.of(this);

  BorderRadius get radius6xl => AppRadius.xl6.of(this);
}

class AppRadius {
  static final ResponsiveValue<BorderRadius> xs = ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(2),
    tablet: BorderRadius.circular(2),
    mobile: BorderRadius.circular(2),
  );

  static final ResponsiveValue<BorderRadius> sm = ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(4),
    tablet: BorderRadius.circular(4),
    mobile: BorderRadius.circular(4),
  );

  static final ResponsiveValue<BorderRadius> sm2 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(6),
    tablet: BorderRadius.circular(6),
    mobile: BorderRadius.circular(4),
  );

  static final ResponsiveValue<BorderRadius> md = ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(8),
    tablet: BorderRadius.circular(8),
    mobile: BorderRadius.circular(8),
  );

  static final ResponsiveValue<BorderRadius> lg = ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(12),
    tablet: BorderRadius.circular(12),
    mobile: BorderRadius.circular(12),
  );

  static final ResponsiveValue<BorderRadius> xl = ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(14),
    tablet: BorderRadius.circular(14),
    mobile: BorderRadius.circular(14),
  );

  static final ResponsiveValue<BorderRadius> xl2 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(16),
    tablet: BorderRadius.circular(16),
    mobile: BorderRadius.circular(16),
  );

  static final ResponsiveValue<BorderRadius> xl3 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(20),
    tablet: BorderRadius.circular(20),
    mobile: BorderRadius.circular(20),
  );

  static final ResponsiveValue<BorderRadius> xl4 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(24),
    tablet: BorderRadius.circular(24),
    mobile: BorderRadius.circular(24),
  );

  static final ResponsiveValue<BorderRadius> xl5 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(32),
    tablet: BorderRadius.circular(32),
    mobile: BorderRadius.circular(32),
  );

  static final ResponsiveValue<BorderRadius> xl6 =
      ResponsiveValue<BorderRadius>(
    desktop: BorderRadius.circular(40),
    tablet: BorderRadius.circular(40),
    mobile: BorderRadius.circular(40),
  );
}

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart' hide ResponsiveValue;
import '../constant/constant.dart';
import '../theme/theme.dart' ;

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get sizeScreen => MediaQuery.of(this).size;

  bool get isMobileBreakPoint =>
      ResponsiveBreakpoints.of(this).screenWidth <=
      ScreenConstant.mobileBreakPoints.end;

  bool get isTabletBreakPoint =>
      ResponsiveBreakpoints.of(this).screenWidth <=
      ScreenConstant.tabletBreakPoints.end;

  bool get isDesktopBreakPoint => !isMobileBreakPoint && !isTabletBreakPoint;

  ResponsiveBreakpointsData get responsive => ResponsiveBreakpoints.of(this);

  AppColorsExtension get color =>
      Theme.of(this).extension<AppColorsExtension>()!;

  T getResponsiveValue<T>({
    T? mobile,
    T? tablet,
    T? desktop,
    T? mobileAndTablet,
    T? tabletAndDesktop,
    T? mobileAndDesktop,
    T? all,
    required T fallback,
  }) {
    final mobileValue = mobile ?? mobileAndTablet ?? mobileAndDesktop ?? all ?? fallback;
    final tabletValue = tablet ?? mobileAndTablet ?? tabletAndDesktop ?? all ?? fallback;
    final desktopValue = desktop ?? tabletAndDesktop ?? mobileAndDesktop ?? all ?? fallback;

    return ResponsiveValue<T>(
      desktop: desktopValue,
      tablet: tabletValue,
      mobile: mobileValue,
    ).of(this);
  }

  T responsiveValue<T>({
    T? mobile,
    T? tablet,
    T? desktop,
    T? mobileAndTablet,
    T? tabletAndDesktop,
    T? mobileAndDesktop,
    T? all,
    required T fallback,
  }) =>
      getResponsiveValue(
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        mobileAndTablet: mobileAndTablet,
        tabletAndDesktop: tabletAndDesktop,
        mobileAndDesktop: mobileAndDesktop,
        all: all,
        fallback: fallback,
      );
}

import 'package:responsive_framework/responsive_framework.dart';

class ScreenConstant {
  static const mobileBreakPoints = Breakpoint(start: 0, end: 480, name: MOBILE);
  static const tabletBreakPoints = Breakpoint(start: 481, end: 800, name: TABLET);
  static const desktopBreakPoints = Breakpoint(start: 801, end: double.infinity, name: DESKTOP);
}
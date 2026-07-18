import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:resource/resource.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared/shared.dart';

/// Widths that straddle every breakpoint and the sections' own auto-layout
/// thresholds (825 for skills, 850 for the hero).
const _widths = <double>[1600, 1440, 1100, 900, 850, 820, 700, 600, 480, 390];

Widget app(Widget child) {
  return MaterialApp(
    theme: AppTheme.darkTheme(),
    locale: const Locale('en'),
    supportedLocales: S.delegate.supportedLocales,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: ResponsiveBreakpoints.builder(
      child: Scaffold(
        body: SingleChildScrollView(child: child),
      ),
      breakpoints: [
        ScreenConstant.mobileBreakPoints,
        ScreenConstant.tabletBreakPoints,
        ScreenConstant.desktopBreakPoints,
      ],
    ),
  );
}

/// Overflow shows up as a FlutterError thrown during layout. Asset decoding
/// noise is not interesting here, so only overflow is treated as a failure.
void expectNoOverflow(WidgetTester tester, double width) {
  final exception = tester.takeException();
  if (exception == null) return;

  final text = exception.toString();
  expect(
    text.contains('overflowed'),
    isFalse,
    reason: 'layout overflowed at width $width:\n$text',
  );
}

void main() {
  Future<void> pumpAt(WidgetTester tester, Widget section, double width) async {
    tester.view.physicalSize = Size(width, 2400);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(app(section));
    await tester.pump(const Duration(milliseconds: 50));
  }

  testWidgets('SkillSectionPage never overflows across breakpoints', (tester) async {
    addTearDown(tester.view.reset);

    for (final width in _widths) {
      await pumpAt(tester, const SkillSectionPage(), width);
      expectNoOverflow(tester, width);
    }
  });

  testWidgets('ProjectSectionPage never overflows across breakpoints', (tester) async {
    addTearDown(tester.view.reset);

    for (final width in _widths) {
      await pumpAt(tester, const ProjectSectionPage(), width);
      expectNoOverflow(tester, width);
    }
  });

  testWidgets('ExperienceSectionPage never overflows across breakpoints', (tester) async {
    addTearDown(tester.view.reset);

    for (final width in _widths) {
      await pumpAt(tester, const ExperienceSectionPage(), width);
      expectNoOverflow(tester, width);
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:resource/resource.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared/shared.dart';

Widget app(ValueNotifier<DesignSystem> mode, Widget child) {
  return ValueListenableBuilder(
    valueListenable: mode,
    builder: (context, value, _) => DesignModeScope(
      notifier: mode,
      child: MaterialApp(
        theme: value == DesignSystem.brutal ? AppTheme.lightTheme() : AppTheme.darkTheme(),
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: ResponsiveBreakpoints.builder(
          child: Scaffold(body: Center(child: child)),
          breakpoints: [
            ScreenConstant.mobileBreakPoints,
            ScreenConstant.tabletBreakPoints,
            ScreenConstant.desktopBreakPoints,
          ],
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('DesignToggle switches between brutal and classic', (tester) async {
    final mode = ValueNotifier(DesignSystem.brutal);
    addTearDown(mode.dispose);

    await tester.pumpWidget(app(mode, const DesignToggle()));
    // Ở brutal, nhãn nút là "Neo".
    expect(find.text('Neo'), findsOneWidget);

    await tester.tap(find.byType(DesignToggle));
    await tester.pumpAndSettle();

    expect(mode.value, DesignSystem.classic);
    expect(find.text('Dark'), findsOneWidget);

    await tester.tap(find.byType(DesignToggle));
    await tester.pumpAndSettle();
    expect(mode.value, DesignSystem.brutal);
    expect(find.text('Neo'), findsOneWidget);
  });

  testWidgets('isBrutal defaults to brutal without a DesignModeScope', (tester) async {
    late bool sawBrutal;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            sawBrutal = context.isBrutal;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(sawBrutal, isTrue);
  });
}

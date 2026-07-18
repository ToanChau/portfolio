import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/widgets/locale_scope.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // ?ds=classic trên URL mở thẳng design cũ — tiện chia sẻ/so sánh.
  late final ValueNotifier<DesignSystem> _designMode = ValueNotifier(
    Uri.base.queryParameters['ds'] == 'classic' ? DesignSystem.classic : DesignSystem.brutal,
  );

  // ?lang=vi mở thẳng bản tiếng Việt.
  late final ValueNotifier<Locale> _locale = ValueNotifier(
    Uri.base.queryParameters['lang'] == 'vi' ? const Locale('vi') : const Locale('en'),
  );

  @override
  void dispose() {
    _designMode.dispose();
    _locale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _designMode,
      builder: (context, mode, _) {
        return ValueListenableBuilder(
          valueListenable: _locale,
          builder: (context, locale, _) {
            return DesignModeScope(
              notifier: _designMode,
              child: LocaleScope(
                notifier: _locale,
                child: MaterialApp(
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    // Deliberately no `trackpad`: the engine turns trackpad scrolls into
                    // pan/zoom events, and listing it here makes them arrive as
                    // PointerMoveEvents, which trips an assertion. Trackpads already
                    // scroll without being declared a drag device.
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.stylus,
                      PointerDeviceKind.unknown,
                    },
                  ),
                  theme: mode == DesignSystem.brutal ? AppTheme.lightTheme() : AppTheme.darkTheme(),
                  debugShowCheckedModeBanner: false,
                  locale: locale,
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: ResponsiveBreakpoints.builder(
                    child: Overlay(
                      initialEntries: [OverlayEntry(builder: (context) => SelectionArea(child: Home()))],
                    ),
                    breakpoints: [
                      ScreenConstant.mobileBreakPoints,
                      ScreenConstant.tabletBreakPoints,
                      ScreenConstant.desktopBreakPoints,
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

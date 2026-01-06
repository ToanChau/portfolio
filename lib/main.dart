import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';
import 'package:shared/shared.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme(),
        debugShowCheckedModeBanner: false,
        home: ResponsiveBreakpoints.builder(
            child: Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => SelectionArea(child: Home()),
                ),
              ],
            ),
            breakpoints: [
              ScreenConstant.mobileBreakPoints,
              ScreenConstant.tabletBreakPoints,
              ScreenConstant.desktopBreakPoints,
            ]
        ));
  }
}

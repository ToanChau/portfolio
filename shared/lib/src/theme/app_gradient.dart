import 'package:flutter/material.dart';

class AppGradient {
  final Gradient brandLight = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF81F3FF),
      Color(0xFF123DFF),
    ],
  );

  final Gradient accentLight = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFD371),
      Color(0xFFE78A3C),
      Color(0xFFD04107),
    ],
  );

  final Gradient newBlue = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF59CAF5),
      Color(0xFF1754FD),
    ],
  );
}

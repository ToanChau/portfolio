import 'package:flutter/material.dart';

abstract class HierarchyColor {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color enable;
  final Color hover;
  final Color focus;
  final Color active;
  final Color disable;

  HierarchyColor({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.enable,
    required this.hover,
    required this.focus,
    required this.active,
    required this.disable,
  });
}

class HierarchySurfaceColor extends HierarchyColor {
  final Color page;
  final Color quaternary;

  HierarchySurfaceColor({
    required this.page,
    required super.primary,
    required super.secondary,
    required super.tertiary,
    required this.quaternary,
    required super.enable,
    required super.hover,
    required super.focus,
    required super.active,
    required super.disable,
  });
//
// HierarchyColor copyWith({
//   Color? page,
//   Color? primary,
//   Color? secondary,
//   Color? tertiary,
//   Color? onButton,
//   Color? quaternary,
//   Color? enable,
//   Color? hover,
//   Color? focus,
//   Color? active,
//   Color? disable,
// }) {
//   return HierarchyColor(
//     page: page ?? this.page,
//     primary: primary ?? this.primary,
//     secondary: secondary ?? this.secondary,
//     tertiary: tertiary ?? this.tertiary,
//     onButton: onButton ?? this.onButton,
//     quaternary: quaternary ?? this.quaternary,
//     enable: enable ?? this.enable,
//     hover: hover ?? this.hover,
//     focus: focus ?? this.focus,
//     active: active ?? this.active,
//     disable: disable ?? this.disable,
//   );
// }
}

class HierarchyTextColor extends HierarchyColor {
  final Color onButton;
  final Color quaternary;
  final Color onButtonAllWhite;
  final Color sub;


  HierarchyTextColor({
    required super.primary,
    required super.secondary,
    required super.tertiary,
    required this.quaternary,
    required this.onButton,
    required this.onButtonAllWhite,
    required super.enable,
    required super.hover,
    required super.focus,
    required super.active,
    required super.disable,
    required this.sub,
  });
}

class HierarchyIconColor extends HierarchyColor {
  final Color onButton;

  HierarchyIconColor({
    required super.primary,
    required super.secondary,
    required super.tertiary,
    required this.onButton,
    required super.enable,
    required super.hover,
    required super.focus,
    required super.active,
    required super.disable,
  });
}

class HierarchyBorderColor extends HierarchyColor {
  HierarchyBorderColor({
    required super.primary,
    required super.secondary,
    required super.tertiary,
    required super.enable,
    required super.hover,
    required super.focus,
    required super.active,
    required super.disable,
  });
}

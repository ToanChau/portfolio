import 'color_hierarchy.dart';

class ColorToken {
  final HierarchySurfaceColor surface;
  final HierarchyTextColor text;
  final HierarchyIconColor icon;
  final HierarchyBorderColor border;

  const ColorToken({
    required this.surface,
    required this.text,
    required this.icon,
    required this.border,
  });

  ColorToken copyWith({
    HierarchySurfaceColor? surface,
    HierarchyTextColor? text,
    HierarchyIconColor? icon,
    HierarchyBorderColor? border,
  }) {
    return ColorToken(
      surface: surface ?? this.surface,
      text: text ?? this.text,
      icon: icon ?? this.icon,
      border: border ?? this.border,
    );
  }
}

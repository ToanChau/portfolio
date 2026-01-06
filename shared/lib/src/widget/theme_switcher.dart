// import 'package:flutter/material.dart';
// import 'package:resource/resource.dart';
// import 'package:shared/shared.dart';
//
// class ThemeSwitcher extends StatefulWidget {
//   final bool isDark;
//   final Function(Brightness brightness) onToggle;
//
//   const ThemeSwitcher({
//     super.key,
//     required this.isDark,
//     required this.onToggle,
//   });
//
//   @override
//   State<ThemeSwitcher> createState() => _ThemeSwitcherState();
// }
//
// class _ThemeSwitcherState extends State<ThemeSwitcher> {
//   bool _hovering = false;
//
//   void _handleToggle() {
//     final newBrightness = widget.isDark ? Brightness.light : Brightness.dark;
//     widget.onToggle(newBrightness);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const double switchWidth = 60;
//     const double switchHeight = 28;
//     const Duration duration = Duration(milliseconds: 300);
//
//     return InkWell(
//       onTap: _handleToggle,
//       onHover: (hovering) {
//         setState(() {
//           _hovering = hovering;
//         });
//       },
//       splashColor: Colors.transparent,
//       child: AnimatedContainer(
//         duration: duration,
//         width: switchWidth,
//         height: switchHeight,
//         padding: const EdgeInsets.symmetric(
//           horizontal: 4,
//           vertical: 6,
//         ),
//         decoration: BoxDecoration(
//           color: context.color.neutral.surface.page,
//           borderRadius: context.radius3xl,
//           border: Border.all(
//             color: _hovering
//                 ? context.color.neutral.border.primary
//                 : context.color.neutral.border.secondary,
//             width: 1,
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Assets.svg.icFilledNight.svg(width: 16.0, height: 16.0),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Assets.svg.icFilledDay.svg(width: 16.0, height: 16.0),
//             ),
//             AnimatedAlign(
//               duration: duration,
//               curve: Curves.easeInOut,
//               alignment:
//                   widget.isDark ? Alignment.centerRight : Alignment.centerLeft,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   color: context.color.neutral.icon.primary,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared/shared.dart';
//
// enum AppButtonStyle { labelOnly, trailingIcon, headingIcon }
//
// enum ButtonType { filled, tonal, outline, text }
//
// enum ButtonSize { xl, lg, md, sm, xs }
//
// class AppButton extends StatefulWidget {
//   final AppButtonStyle style;
//   final ButtonType type;
//   final ButtonSize size;
//   final String content;
//   final Function() onPressed;
//   final bool disable;
//
//   const AppButton({
//     super.key,
//     required this.style,
//     required this.type,
//     required this.size,
//     required this.content,
//     required this.onPressed,
//     this.disable = false,
//   });
//
//   @override
//   State<AppButton> createState() => _AppButtonState();
// }
//
// class _AppButtonState extends State<AppButton> {
//   final _controller = WidgetStatesController();
//
//   @override
//   void initState() {
//     _updateWidgetState();
//     super.initState();
//   }
//
//   @override
//   didUpdateWidget(AppButton oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.disable != widget.disable) {
//       _updateWidgetState();
//     }
//   }
//
//   _updateWidgetState() {
//     _controller.update(WidgetState.disabled, widget.disable);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: _controller,
//         builder: (context, states, child) {
//           return Container(
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//               shape: _outlineShape,
//               borderRadius: _radius,
//             ),
//             child: TextButton(
//               statesController: _controller,
//               onPressed: widgets.disable ? null : widgets.onPressed,
//               style: _buttonStyle,
//               child: widgets.content
//                   .typo({context.paragraph1Semibold, Typo.color(contentColor)}),
//             ),
//           );
//         });
//   }
//
//   ButtonStyle get _buttonStyle => ButtonStyle(
//         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         minimumSize: WidgetStateProperty.all(Size.zero),
//         padding: WidgetStateProperty.all(padding),
//         side: _side,
//         backgroundColor: WidgetStateColor.resolveWith(backgroundColor),
//         overlayColor:
//             WidgetStateProperty.resolveWith((states) => Colors.transparent),
//         shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
//           return RoundedRectangleBorder(
//             borderRadius: _radius ?? BorderRadius.zero,
//           );
//         }),
//       );
//
//   BorderRadius? get _radius {
//     if (widgets.iconOnly) {
//       return null;
//     }
//     if (widgets.type == ButtonType.linkColor ||
//         widgets.type == ButtonType.linkGray) {
//       return BorderRadius.zero;
//     }
//     return switch (widgets.size) {
//       ButtonSize.large => BorderRadius.circular(12.0),
//       ButtonSize.medium => BorderRadius.circular(10.0),
//       ButtonSize.small => BorderRadius.circular(8.0),
//       ButtonSize.xSmall => BorderRadius.circular(6.0),
//     };
//   }
//
//   BoxShape get _outlineShape {
//     if (widgets.iconOnly) {
//       return BoxShape.circle;
//     }
//     return BoxShape.rectangle;
//   }
//
//   double get iconSize {
//     return switch (widgets.size) {
//       ButtonSize.large => 20.0,
//       ButtonSize.medium => 20.0,
//       ButtonSize.small => 16.0,
//       ButtonSize.xSmall => 16.0,
//     };
//   }
//
//   CompositeTypo get textTypo {
//     return switch (widgets.size) {
//       ButtonSize.large => Typos.heading16,
//       ButtonSize.medium => Typos.heading16,
//       ButtonSize.small => Typos.heading14,
//       ButtonSize.xSmall => Typos.heading12,
//     };
//   }
//
//   Color get contentColor {
//     if (widgets.disable) {
//       return context.color.neutral.text.disable;
//     }
//     switch (widgets.type) {
//       case ButtonType.primary:
//         return context.appColor.mainWhite;
//       case ButtonType.secondary:
//         return context.appColor.neutral900;
//       case ButtonType.tertiary:
//         return context.appColor.neutral900;
//       case ButtonType.destructive:
//         return context.appColor.mainWhite;
//       case ButtonType.linkGray:
//         return context.appColor.neutral700;
//       case ButtonType.linkColor:
//         return context.appColor.information500;
//     }
//   }
//
//   ButtonStyle get _buttonStyle => ButtonStyle(
//         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         minimumSize: WidgetStateProperty.all(Size.zero),
//         padding: WidgetStateProperty.all(padding),
//         side: _side,
//         backgroundColor: WidgetStateColor.resolveWith(backgroundColor),
//         overlayColor:
//             WidgetStateProperty.resolveWith((states) => Colors.transparent),
//         shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
//           if (widgets.iconOnly) {
//             return const CircleBorder();
//           }
//           if (widgets.type == ButtonType.linkColor ||
//               widgets.type == ButtonType.linkGray) {
//             return const RoundedRectangleBorder();
//           }
//           return RoundedRectangleBorder(
//             borderRadius: _radius ?? BorderRadius.zero,
//           );
//         }),
//       );
//
//   WidgetStateProperty<BorderSide>? get _side {
//     if (widgets.type != ButtonType.secondary) return null;
//     if (widgets.iconOnly) {
//       return WidgetStateProperty.resolveWith<BorderSide>((states) {
//         if (states.contains(WidgetState.pressed)) {
//           return BorderSide.none;
//         }
//         if (states.contains(WidgetState.hovered)) {
//           return const BorderSide(
//             color: Color(0xFFDFE1E7),
//             width: 1.0,
//           );
//         }
//         return BorderSide(
//           color: context.appColor.neutral200,
//           width: 1.0,
//         );
//       });
//     }
//     return WidgetStateProperty.resolveWith<BorderSide>((states) {
//       if (states.contains(WidgetState.pressed)) {
//         return BorderSide.none;
//       }
//       if (states.contains(WidgetState.disabled) && widgets.disable) {
//         return BorderSide(
//           color: context.appColor.neutral200,
//           width: 1.0,
//         );
//       }
//       return BorderSide(
//         color: context.appColor.neutral400,
//         width: 1.0,
//       );
//     });
//   }
//
//   Color backgroundColor(Set<WidgetState> states) {
//     if (states.contains(WidgetState.disabled) && widgets.disable) {
//       if ([ButtonType.primary, ButtonType.destructive].contains(widgets.type)) {
//         return context.appColor.neutral200;
//       }
//       return context.appColor.mainWhite;
//     }
//     if (states.contains(WidgetState.hovered)) {
//       return switch (widgets.type) {
//         ButtonType.primary => context.appColor.primary700,
//         ButtonType.secondary => const Color(0xFFF6F8FA),
//         ButtonType.tertiary => const Color(0xFFF6F8FA),
//         ButtonType.destructive => context.appColor.error700,
//         ButtonType.linkGray => Colors.transparent,
//         ButtonType.linkColor => Colors.transparent,
//       };
//     }
//     return switch (widgets.type) {
//       ButtonType.primary => context.appColor.primary600,
//       ButtonType.secondary => context.appColor.mainWhite,
//       ButtonType.tertiary => context.appColor.mainWhite,
//       ButtonType.destructive => context.appColor.error500,
//       ButtonType.linkGray => Colors.transparent,
//       ButtonType.linkColor => Colors.transparent,
//     };
//   }
//
//   EdgeInsets get padding {
//     if ([ButtonType.linkColor, ButtonType.linkGray].contains(widgets.type)) {
//       return EdgeInsets.zero;
//     }
//     if (widgets.iconOnly) {
//       final padding = switch (widgets.size) {
//         ButtonSize.large => 16.0,
//         ButtonSize.medium => 14.0,
//         ButtonSize.small => 10.0,
//         ButtonSize.xSmall => 8.0,
//       };
//       return EdgeInsets.all(padding);
//     }
//     switch (widgets.size) {
//       case ButtonSize.large:
//         return const EdgeInsets.all(16.0);
//       case ButtonSize.medium:
//         return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0);
//       case ButtonSize.small:
//         return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
//       case ButtonSize.xSmall:
//         return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
//     }
//   }
// }

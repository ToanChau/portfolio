// import 'package:flutter/material.dart';
// import 'package:shared/shared.dart';
//
// class AppShadow {
//   static List<BoxShadow> layer1Up(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, -5),
//         blurRadius: 12,
//         spreadRadius: 4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.09),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -3),
//         blurRadius: 6,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -1),
//         blurRadius: 2,
//         spreadRadius: -2,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.16),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer1Down(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, 5),
//         blurRadius: 12,
//         spreadRadius: 4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.09),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 3),
//         blurRadius: 6,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 1),
//         blurRadius: 2,
//         spreadRadius: -2,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.16),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer1Left(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(-5, 0),
//         blurRadius: 12,
//         spreadRadius: 4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.09),
//       ),
//       BoxShadow(
//         offset: const Offset(-3, 0),
//         blurRadius: 6,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//       BoxShadow(
//         offset: const Offset(-1, 0),
//         blurRadius: 2,
//         spreadRadius: -2,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.16),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer1Right(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(5, 0),
//         blurRadius: 12,
//         spreadRadius: 4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.09),
//       ),
//       BoxShadow(
//         offset: const Offset(3, 0),
//         blurRadius: 6,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//       BoxShadow(
//         offset: const Offset(1, 0),
//         blurRadius: 2,
//         spreadRadius: -2,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.16),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer2Up(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, -9),
//         blurRadius: 28,
//         spreadRadius: 8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -6),
//         blurRadius: 16,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -3),
//         blurRadius: 6,
//         spreadRadius: -4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer2Down(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, 9),
//         blurRadius: 28,
//         spreadRadius: 8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 6),
//         blurRadius: 16,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 3),
//         blurRadius: 6,
//         spreadRadius: -4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer2Left(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(-9, 0),
//         blurRadius: 28,
//         spreadRadius: 8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(-6, 0),
//         blurRadius: 16,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//       BoxShadow(
//         offset: const Offset(-3, 0),
//         blurRadius: 6,
//         spreadRadius: -4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer2Right(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(9, 0),
//         blurRadius: 28,
//         spreadRadius: 8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(6, 0),
//         blurRadius: 16,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//       BoxShadow(
//         offset: const Offset(3, 0),
//         blurRadius: 6,
//         spreadRadius: -4,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.12),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer3Up(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, -12),
//         blurRadius: 48,
//         spreadRadius: 16,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.03),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -9),
//         blurRadius: 28,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(0, -6),
//         blurRadius: 16,
//         spreadRadius: -8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer3Down(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(0, 12),
//         blurRadius: 48,
//         spreadRadius: 16,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.03),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 9),
//         blurRadius: 28,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(0, 6),
//         blurRadius: 16,
//         spreadRadius: -8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer3Left(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(-12, 0),
//         blurRadius: 48,
//         spreadRadius: 16,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.03),
//       ),
//       BoxShadow(
//         offset: const Offset(-9, 0),
//         blurRadius: 28,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(-6, 0),
//         blurRadius: 16,
//         spreadRadius: -8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> layer3Right(BuildContext context) {
//     return [
//       BoxShadow(
//         offset: const Offset(12, 0),
//         blurRadius: 48,
//         spreadRadius: 16,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.03),
//       ),
//       BoxShadow(
//         offset: const Offset(9, 0),
//         blurRadius: 28,
//         spreadRadius: 0,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.05),
//       ),
//       BoxShadow(
//         offset: const Offset(6, 0),
//         blurRadius: 16,
//         spreadRadius: -8,
//         color: context.appColor.darkBlue950.withValues(alpha: 0.08),
//       ),
//     ];
//   }
// }

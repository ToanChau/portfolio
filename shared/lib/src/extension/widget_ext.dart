import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

extension WidgetExtension on Widget {
  Widget square(double size) {
    return SizedBox(
      height: size,
      width: size,
      child: this,
    );
  }

  Widget padding([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget paddingOnly(
      {double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0),
      child: this,
    );
  }

  Widget margin([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget marginOnly(
      {double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0),
      child: this,
    );
  }

  Widget inkTap({required Function? onTap}) {
    return InkWell(
      onTap: onTap?.call as void Function()?,
      child: this,
    );
  }

  Widget interactive({
    VoidCallback? onTap,
    Color? hoverColor,
    double scale = 1.05, // Tùy chỉnh độ phóng to
  }) {
    return ScaleTapWidget(
      onTap: onTap,
      hoverColor: hoverColor,
      scaleHover: scale,
      child: this,
    );
  }

  Widget roundedInkWell(
      {required Function onTap, double radius = 8, Color? color}) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onTap.call(),
        child: this,
      ),
    );
  }

  Widget expand({int? flex, bool enable = true}) {
    if (!enable) {
      return this;
    }
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget center({bool enable = true}) {
    return enable ? Center(child: this) : this;
  }

  Widget align(AlignmentGeometry alignment) => Align(
        alignment: alignment,
        child: this,
      );
}

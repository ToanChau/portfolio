
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final bool autoLayout;
  final BoxConstraints? constraints;
  final double spacing;
  final bool Function(BoxConstraints actualConstraints)? onCheckAutoLayout;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.autoLayout = false,
    this.onCheckAutoLayout,
    this.spacing = 0,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      child: LayoutBuilder(
        builder: (context, actualConstraints) {
          final shouldAutoLayout =
              onCheckAutoLayout?.call(actualConstraints) ?? false;
          if (context.isMobileBreakPoint) {
            return mobile;
          } else if (context.isTabletBreakPoint) {
            if (shouldAutoLayout) {
              return mobile;
            }
            return tablet;
          } else {
            if (shouldAutoLayout) {
              if (tablet == desktop)
                return mobile;
              else
                return tablet;
            }
            return desktop;
          }
        },
      ),
    );
  }
}

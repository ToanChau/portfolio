import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:shared/shared.dart';

class MainHeader extends StatefulWidget {
  final Function(HeaderMenu)? onChange;
  final HeaderMenu? activeMenu;

  const MainHeader({super.key, this.onChange, this.activeMenu});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  @override
  Widget build(BuildContext context) {
    final activeMenu = widget.activeMenu;

    return SliverAppBar(
      iconTheme: IconThemeData(color: context.color.brand.icon.primary),
      backgroundColor: Colors.transparent,
      pinned: true,
      elevation: 0,
      toolbarHeight: context.responsiveValue(desktop: 88, mobile: 64, tablet: 72, fallback: 88),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: context.padding128_80_64, vertical: context.padding16_08_04),
              width: context.sizeScreen.width,
              height: context.responsiveValue(desktop: 88, mobile: 64, tablet: 72, fallback: 88),
              child: context.isDesktopBreakPoint
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Logo().inkTap(onTap:()=> widget.onChange?.call(HeaderMenu.home))),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end  ,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: context.gap48_40_24,
                              children: HeaderMenu.values
                                  .map(
                                    (e) => MenuItem(
                                      content: e.label,
                                      isActive: activeMenu == e,
                                      onTap: () {
                                        widget.onChange?.call(e);
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Logo(),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String content;
  final bool? isActive;
  final VoidCallback? onTap;

  const MenuItem({super.key, required this.content, this.onTap, this.isActive});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _setHovered(bool hovered) {
    if (hovered) {
      _scaleController.forward();
    } else if (!widget.isActive!) {
      _scaleController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isActive ?? false;
    final activeColor = context.color.brand.text.primary;
    final defaultColor = context.color.neutral.text.primary;

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.content
            .typo({context.paragraph2Medium, Typo.color(isActive ? activeColor : defaultColor)})
            .interactive(onTap: widget.onTap),
      ),
    );
  }
}

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
    final isBrutal = context.isBrutal;

    final bar = Container(
      padding: EdgeInsets.symmetric(horizontal: context.padding128_80_64, vertical: context.padding16_08_04),
      width: context.sizeScreen.width,
      decoration: isBrutal
          ? const BoxDecoration(
              color: BrutalColors.cream,
              border: Border(bottom: BorderSide(color: BrutalColors.ink, width: 3)),
            )
          : null,
      height: context.responsiveValue(desktop: 88, mobile: 64, tablet: 72, fallback: 88),
      child: context.isDesktopBreakPoint
          ? Row(
              children: [
                Logo().inkTap(onTap: () => widget.onChange?.call(HeaderMenu.home)),
                const SizedBox(width: 24),
                // FittedBox co toàn bộ menu lại khi thiếu chỗ thay vì để
                // SingleChildScrollView cắt mất item cuối (nút toggle).
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: context.gap24_16_12,
                        children: [
                          ...HeaderMenu.values.map(
                            (e) => MenuItem(
                              content: e.label(context),
                              isActive: activeMenu == e,
                              onTap: () {
                                widget.onChange?.call(e);
                              },
                            ),
                          ),
                          const DesignToggle(),
                          const LangToggle(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [DesignToggle(), LangToggle()],
                ),
              ],
            ),
    );

    return SliverAppBar(
      iconTheme: IconThemeData(color: isBrutal ? BrutalColors.ink : context.color.brand.icon.primary),
      backgroundColor: Colors.transparent,
      pinned: true,
      elevation: 0,
      toolbarHeight: context.responsiveValue(desktop: 88, mobile: 64, tablet: 72, fallback: 88),
      flexibleSpace: ClipRect(
        child: isBrutal
            ? Center(child: bar)
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(child: bar),
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
    } else if (!(widget.isActive ?? false)) {
      _scaleController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isActive ?? false;
    final isBrutal = context.isBrutal;

    final textColor = isBrutal
        ? BrutalColors.ink
        : (isActive ? context.color.brand.text.primary : context.color.neutral.text.primary);

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: isBrutal && isActive
              ? BrutalDecoration.flatChip(color: BrutalColors.yellow, borderWidth: 2, radius: 8)
              : const BoxDecoration(color: Colors.transparent),
          child: widget.content
              .typo({context.paragraph2Medium, Typo.color(textColor)})
              .interactive(onTap: widget.onTap),
        ),
      ),
    );
  }
}

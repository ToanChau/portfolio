import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:shared/shared.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  HeaderMenu? _currentMenu = HeaderMenu.home;

  final Map<HeaderMenu, GlobalKey> _sectionKeys = {
    HeaderMenu.home: GlobalKey(),
    HeaderMenu.about: GlobalKey(),
    HeaderMenu.skills: GlobalKey(),
    HeaderMenu.project: GlobalKey(),
    // HeaderMenu.education: GlobalKey(),
    // HeaderMenu.experience: GlobalKey(),
    // HeaderMenu.contact: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveMenu);
  }

  void _updateActiveMenu() {
    final screenHeight = context.size!.height;
    int maxVisibleIndex = -1;
    double maxVisibleFraction = 0;

    for (var menu in HeaderMenu.values) {
      final key = _sectionKeys[menu];
      if (key?.currentContext != null) {
        final RenderBox renderBox = key!.currentContext!.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final offset = renderBox.localToGlobal(Offset.zero).dy;

        double visibleTop = offset < 0 ? 0 : offset;
        double visibleBottom = offset + size.height > screenHeight ? screenHeight : offset + size.height;
        double visibleHeight = visibleBottom - visibleTop;

        if (visibleHeight > 0) {
          double visibleFraction = visibleHeight / screenHeight;

          if (visibleFraction > maxVisibleFraction) {
            maxVisibleFraction = visibleFraction;
            maxVisibleIndex = menu.index;
          }
        }
      }
    }

    if (maxVisibleIndex >= 0 && maxVisibleIndex < HeaderMenu.values.length) {
      final visibleMenu = HeaderMenu.values[maxVisibleIndex];
      if (_currentMenu != visibleMenu) {
        setState(() => _currentMenu = visibleMenu);
      }
    }
  }

  void _scrollToSection(HeaderMenu section) {
    final key = _sectionKeys[section];

    if (key?.currentContext != null) {
      try {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
          alignment: 0.1,
        );
        return;
      } catch (e) {
      }
    }

    _scrollToSectionByIndex(section.index);
  }

  void _scrollToSectionByIndex(int sectionIndex) {
    // Approximate heights của mỗi section
    const approximateHeights = {
      0: 800.0,  // Home/About section
      1: 1200.0, // About Detail section
      2: 1000.0, // Skills section
      3: 1200.0, // Project section
    };

    double targetOffset = 0;

    for (int i = 0; i < sectionIndex && i < approximateHeights.length; i++) {
      targetOffset += approximateHeights[i] ?? 800.0;
    }

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: !context.isDesktopBreakPoint
          ? MenuDrawer(menu: _currentMenu ?? HeaderMenu.home, onMenuTap: _scrollToSection)
          : null,
      body: AnimatedBackground(
        enableSpotlight: false,
        child: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              MainHeader(onChange: _scrollToSection, activeMenu: _currentMenu),
              SliverList.builder(
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                        key: _sectionKeys[HeaderMenu.home],
                        child: AboutSectionPage(
                          onViewProjectTap: () => _scrollToSection(HeaderMenu.project),
                          onGetInTouchTap: () => _scrollToSection(HeaderMenu.about),
                        ),
                      ).marginOnly(bottom: context.gap80_64_40);
                    case 1:
                      return Container(
                        key: _sectionKeys[HeaderMenu.about],
                        child: AboutDetailPage(),
                      ).marginOnly(bottom: context.gap80_64_40);
                    case 2:
                      return Container(
                        key: _sectionKeys[HeaderMenu.skills],
                        child: SkillSectionPage().marginOnly(bottom: context.gap80_64_40),
                      );
                    case 3:
                      return Container(
                        key: _sectionKeys[HeaderMenu.project],
                        child: ProjectSectionPage().marginOnly(bottom: context.gap80_64_40),
                      );
                    default:
                      return SizedBox.shrink();
                  }
                },
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateActiveMenu);
    _scrollController.dispose();
    super.dispose();
  }
}

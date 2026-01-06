import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';


enum HeaderMenu {
  home,
  about,
  skills,
  project,;
  // education,
  // experience,
  // contact;

  String get label => switch (this) {
    HeaderMenu.home => "Home",
    HeaderMenu.about => "About",
    HeaderMenu.skills => "Skills",
    HeaderMenu.project => "Project",
    // HeaderMenu.education => "Education",
    // HeaderMenu.experience => "Experience",
    // HeaderMenu.contact => "Contact",
  };
}

class MenuDrawer extends StatelessWidget {
  final HeaderMenu menu;
  final Function(HeaderMenu)? onMenuTap;

  const MenuDrawer({super.key, required this.menu, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.color.neutral.surface.page,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.padding128_32_16,
          vertical: context.padding32_16_12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(),
                Button(
                  type: ButtonType.outlined,
                  size: ButtonSize.lg,
                  iconOnly: true,
                  icon: Assets.svg.icBackArrow,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ).marginOnly(bottom: context.gap80_64_40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: context.gap48_40_24,
              children: HeaderMenu.values
                  .map(
                    (e) => MenuTap(
                      content: menuContent(e),
                      active: menu == e,
                      onTap: () {
                        onMenuTap?.call(e);
                        Navigator.pop(context);
                      },
                      center: false,
                    ),
                  )
                  .toList(),
            ),
            Container(
              height: 1.0,
              margin: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                borderRadius: context.radiusXs,
                color: context.color.neutral.surface.secondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // LanguageSwitch(
                //   initialLanguage: App.appStateOf(context).locale.languageCode,
                //   onLanguageChanged: (isVieSelected) {
                //     App.appStateOf(context).setLocale(
                //       isVieSelected
                //           ? const Locale.fromSubtags(languageCode: 'vi')
                //           : const Locale.fromSubtags(languageCode: 'en'),
                //     );
                //   },
                // ),
              ],
            ).marginOnly(bottom: context.gap48_40_24),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     S.of(context).theme.typo({
            //       context.caption1Medium,
            //       Typo.color(context.color.neutral.text.secondary),
            //     }),
            //     ThemeSwitcher(
            //       isDark: App.appStateOf(context).theme == Brightness.dark,
            //       onToggle: (theme) {
            //         App.appStateOf(context).setTheme(theme);
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  String menuContent(HeaderMenu menu) {
    return switch (menu) {
      HeaderMenu.home => "Home",
      HeaderMenu.about => "About",
      // HeaderMenu.contact=>"Contact",
      // HeaderMenu.education=>"Education",
      // HeaderMenu.experience=> "Experience",
      HeaderMenu.project=>"Project",
      HeaderMenu.skills=>"Skills",
    };
  }

  // void _onOpenPage(BuildContext context, HeaderMenu e) {
  //   switch (e) {
  //     case HeaderMenu.home:
  //       context.navigator.openHome();
  //       break;
  //     case HeaderMenu.aboutUs:
  //       context.navigator.openAboutUs();
  //       break;
  //     case HeaderMenu.ecosystem:
  //       context.navigator.openEcosystem();
  //       break;
  //     case HeaderMenu.contact:
  //       context.navigator.openContact();
  //       break;
  //   }
  // }
}

class MenuTap extends StatefulWidget {
  final bool active;
  final String content;
  final Function() onTap;
  final bool center;

  const MenuTap({
    super.key,
    this.active = false,
    required this.content,
    required this.onTap,
    this.center = true,
  });

  @override
  State<MenuTap> createState() => _MenuTapState();
}

class _MenuTapState extends State<MenuTap> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 2.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovering
                    ? context.color.neutral.border.primary
                    : Colors.transparent,
                width: 1.0,
              ),
            ),
          ),
          child: widget.content
              .typo({
                context.paragraph2Medium,
                Typo.color(
                  widget.active
                      ? context.color.brand.text.enable
                      : (_hovering
                            ? context.color.neutral.text.primary
                            : context.color.neutral.text.tertiary),
                ),
              })
              .center(enable: widget.center),
        ),
      ),
    );
  }
}

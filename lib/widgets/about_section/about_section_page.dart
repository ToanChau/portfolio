import 'package:flutter/material.dart';
import 'about_section.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';
import 'about_hero.dart';

class AboutSectionPage extends StatelessWidget {
  final VoidCallback? onViewProjectTap;
  final VoidCallback? onGetInTouchTap;

  const AboutSectionPage({super.key, this.onViewProjectTap, this.onGetInTouchTap});

  @override
  Widget build(BuildContext context) {
    final mobile = Column(
      children: [
        AboutContent(onViewProjectTap: onViewProjectTap, onGetInTouchTap: onGetInTouchTap,),
        AboutHero(
          imagePath: Assets.png.me1.path,
          size: context.responsiveValue(fallback: 360,mobile: 230,tablet: 290),
          floatingCards: [
            FloatingCardData(
              title: 'Flutter',
              subtitle: 'Expert Level',
              icon: Assets.svg.icFlutter,
              position: FloatingPosition(top: 20, right: -20),
            ),
            FloatingCardData(
              title: 'Firebase',
              subtitle: 'Backend',
              icon: Assets.svg.icFirebase,

              position: FloatingPosition(bottom: 60, left: -40),
            ),
            FloatingCardData(
              title: 'Dart',
              subtitle: 'Core Language',
              icon: Assets.svg.icDart,
              position: FloatingPosition(bottom: 20, right: 40),
            ),
          ],
        ),
      ],
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_32_16),
      child: ResponsiveWidget(
        onCheckAutoLayout: (constrain)=>constrain.maxWidth<850,
        tablet: mobile,
        mobile: mobile,
        desktop: Row(
          children: [
            Expanded(child: AboutContent(onViewProjectTap: onViewProjectTap, onGetInTouchTap: onGetInTouchTap,)),
            Expanded(
              child: AboutHero(
                imagePath: Assets.png.me1.path,
                size: context.responsiveValue(fallback: 360,mobile: 230,tablet: 290),
                floatingCards: [
                  FloatingCardData(
                    title: 'Flutter',
                    subtitle: 'Expert Level',
                    icon: Assets.svg.icFlutter,
                    position: FloatingPosition(top: 20, right: 100),
                  ),
                  FloatingCardData(
                    title: 'Firebase',
                    subtitle: 'Backend',
                    icon: Assets.svg.icFirebase,
                    position: FloatingPosition(bottom: 90, left: 10),
                  ),
                  FloatingCardData(
                    title: 'Dart',
                    subtitle: 'Core Language',
                    icon: Assets.svg.icDart,
                    position: FloatingPosition(bottom: 20, right: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class AchievementData {
  final String title;
  final String subtitle;

  const AchievementData(this.title, this.subtitle);
}

final List<AchievementData> aboutAchievements = [
  const AchievementData("8+", "Projects"),
  const AchievementData("3", "Teams Led"),
  const AchievementData("2nd", "Prize Winner"),
];

class AboutContent extends StatelessWidget {
  final VoidCallback? onViewProjectTap;
  final VoidCallback? onGetInTouchTap;

  const AboutContent({super.key, this.onViewProjectTap, this.onGetInTouchTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.responsiveValue(fallback: CrossAxisAlignment.center,desktop:CrossAxisAlignment.start ),
      children: [
        StatusBadge(text: "Available for opportunities").paddingOnly(bottom: context.padding32_16_12),
        "Hi, I'm".typo({context.heading2Semibold, Typo.color(context.color.neutral.text.primary)}),
        TextMaskVideo(
          text: "Châu Đức Toàn".typo({context.heading2Semibold, Typo.color(context.color.brand.surface.primary)}),
          isDark: true,
        ),
        "Fresher Mobile Developer specializing in Flutter,\nClean Architecture & BLoC Pattern. Building beautiful, scalable apps."
            .typo({context.heading6Light, Typo.color(context.color.neutral.text.tertiary),context.responsiveValue(fallback: Typo.align.center,desktop:Typo.align.left)})
            .paddingOnly(bottom: context.padding48_32_24, top: context.padding06_04_02),
        Row(
          mainAxisAlignment: context.responsiveValue(fallback: MainAxisAlignment.center,desktop:MainAxisAlignment.start),
          spacing: context.gap48_40_24,
          children: aboutAchievements.map((e) => AboutContentItem(title: e.title, subtitle: e.subtitle)).toList(),
        ).paddingOnly(bottom: context.gap24_16_12),
        Row(
          mainAxisAlignment: context.responsiveValue(fallback: MainAxisAlignment.center,desktop:MainAxisAlignment.start),
          spacing: context.gap24_16_12,
          children: [
            Button(type: ButtonType.tonal, size: ButtonSize.lg,icon: Assets.svg.icRocket,content: "View Project",onPressed: onViewProjectTap,),
            Button(type: ButtonType.outlined, size: ButtonSize.lg,icon: Assets.svg.icPaperPlane,content: "Get in Touch",onPressed: onGetInTouchTap,),
          ],
        )
      ],
    );
  }
}

class AboutContentItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const AboutContentItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.typo({context.heading4Semibold, Typo.color(context.color.neutral.text.primary)}),
        subtitle.typo({context.caption1Regular, Typo.color(context.color.neutral.text.quaternary)}),
      ],
    );
  }
}

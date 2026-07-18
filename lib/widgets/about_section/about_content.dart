import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';
import 'package:url_launcher/url_launcher.dart';

/// Mở CV trong tab mới. Trên Flutter web, asset được serve dưới
/// `assets/<asset-key>`, nên URL đầy đủ là `assets/assets/pdf/...`.
Future<void> downloadCv() async {
  final uri = Uri.base.resolve('assets/${Assets.pdf.chauDucToanFlutterCV}');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }
}

class AchievementData {
  final String title;
  final String subtitle;

  const AchievementData(this.title, this.subtitle);
}

List<AchievementData> aboutAchievements(BuildContext context) => [
      AchievementData("8+", S.of(context).stat_projects),
      AchievementData("3", S.of(context).stat_teams_led),
      AchievementData("2nd", S.of(context).stat_prize_winner),
    ];

class AboutContent extends StatelessWidget {
  final VoidCallback? onViewProjectTap;
  final VoidCallback? onGetInTouchTap;

  const AboutContent({super.key, this.onViewProjectTap, this.onGetInTouchTap});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    final headingColor = isBrutal ? BrutalColors.ink : context.color.neutral.text.primary;
    final bodyColor = isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.tertiary;

    return Column(
      crossAxisAlignment: context.responsiveValue(fallback: CrossAxisAlignment.center,desktop:CrossAxisAlignment.start ),
      children: [
        StatusBadge(text: S.of(context).available_for_opportunities).paddingOnly(bottom: context.padding32_16_12),
        S.of(context).hi_im.typo({context.heading2Semibold, Typo.color(headingColor)}),
        if (isBrutal)
          BrutalHighlight(
            color: BrutalColors.yellow,
            child: "Châu Đức Toàn".typo({context.heading2Semibold, Typo.color(BrutalColors.ink)}),
          ).paddingOnly(top: context.padding06_04_02)
        else
          TextMaskVideo(
            text: "Châu Đức Toàn".typo({context.heading2Semibold, Typo.color(context.color.brand.surface.primary)}),
            isDark: true,
          ),
        S.of(context).hero_description
            .typo({context.heading6Light, Typo.color(bodyColor),context.responsiveValue(fallback: Typo.align.center,desktop:Typo.align.left)})
            .paddingOnly(bottom: context.padding48_32_24, top: context.padding16_08_04),
        Row(
          mainAxisAlignment: context.responsiveValue(fallback: MainAxisAlignment.center,desktop:MainAxisAlignment.start),
          spacing: context.gap48_40_24,
          children: aboutAchievements(context).map((e) => Flexible(child: AboutContentItem(title: e.title, subtitle: e.subtitle))).toList(),
        ).paddingOnly(bottom: context.gap24_16_12),
        Wrap(
          alignment: context.responsiveValue(fallback: WrapAlignment.center, desktop: WrapAlignment.start),
          spacing: context.gap24_16_12,
          runSpacing: context.gap12_04_04,
          children: isBrutal
              ? [
                  BrutalButton(label: S.of(context).view_project, icon: Assets.svg.icRocket, color: BrutalColors.yellow, onPressed: onViewProjectTap),
                  BrutalButton(label: S.of(context).get_in_touch, icon: Assets.svg.icPaperPlane, color: BrutalColors.paper, onPressed: onGetInTouchTap),
                  BrutalButton(label: S.of(context).download_cv, icon: Assets.svg.icDownload, color: BrutalColors.green, onPressed: downloadCv),
                ]
              : [
                  Button(type: ButtonType.tonal, size: context.responsiveValue(fallback: ButtonSize.lg,mobileAndTablet: ButtonSize.xs), icon: Assets.svg.icRocket, content: S.of(context).view_project, onPressed: onViewProjectTap),
                  Button(type: ButtonType.outlined, size: context.responsiveValue(fallback: ButtonSize.lg,mobileAndTablet: ButtonSize.xs), icon: Assets.svg.icPaperPlane, content: S.of(context).get_in_touch, onPressed: onGetInTouchTap),
                  Button(type: ButtonType.outlined, size: context.responsiveValue(fallback: ButtonSize.lg,mobileAndTablet: ButtonSize.xs), icon: Assets.svg.icDownload, content: S.of(context).download_cv, onPressed: downloadCv),
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
        title.typo({
          context.heading4Semibold,
          Typo.color(context.isBrutal ? BrutalColors.ink : context.color.neutral.text.primary)
        }),
        subtitle.typo({
          context.caption1Regular,
          Typo.color(context.isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.quaternary)
        }),
      ],
    );
  }
}

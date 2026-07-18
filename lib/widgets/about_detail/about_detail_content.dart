import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class AboutDetailContent extends StatelessWidget {
  const AboutDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.gap24_16_12,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: context.isDesktopBreakPoint ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        S.of(context).flutter_developer.typo({Typo.color(context.color.neutral.text.primary), context.heading3Semibold}),
        S.of(context).about_description
            .typo({Typo.color(context.color.neutral.text.primary), context.paragraph1Regular, Typo.clip}),
        InfoGroup(),
      ],
    );
  }
}

class InfoGroup extends StatelessWidget {
  const InfoGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      InfoItem(
        label: S.of(context).address,
        icon: Assets.svg.icLocation,
        link: "https://www.google.com/maps/search/?api=1&query=Thu+Duc,+Ho+Chi+Minh+City,+Vietnam",
      ),
      InfoItem(label: "+84 941 544 797", icon: Assets.svg.icPhone, link: "tel:0941544797"),
      InfoItem(label: "toanpl060@gmail.com", icon: Assets.svg.icMail, link: "mailto:toanpl060@gmail.com"),
      InfoItem(label: "github.com/ToanChau", icon: Assets.svg.icGithub, link: "https://github.com/ToanChau"),
    ];
    final mobile = Column(
      spacing: context.gap24_16_12,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infoItems.map((e) => e).toList(),
    );
    final desktop = Row(
      spacing: context.gap24_16_12,
      children: [
        Expanded(
          child: Column(
            spacing: context.gap24_16_12,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [infoItems[0], infoItems[1]],
          ),
        ),
        Expanded(
          child: Column(
            spacing: context.gap24_16_12,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [infoItems[2], infoItems[3]],
          ),
        ),
      ],
    );
    return ResponsiveWidget(
      mobile: mobile,
      tablet: desktop,
      onCheckAutoLayout: (constrain) {
        return constrain.maxWidth < 600 ;
      },
      desktop: desktop,
    );
  }
}

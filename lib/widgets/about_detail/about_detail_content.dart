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
        "Flutter Developer".typo({Typo.color(context.color.neutral.text.primary), context.heading3Semibold}),
        "I'm a passionate Flutter developer with a strong foundation in Clean Architecture and BLoC pattern. I love building beautiful, scalable mobile applications that provide great user experiences."
            .typo({Typo.color(context.color.neutral.text.primary), context.paragraph1Regular, Typo.clip}),
        InfoGroup(),
      ],
    );
  }
}

class InfoGroup extends StatelessWidget {
  const InfoGroup({super.key});

  @override  Widget build(BuildContext context) {
    final infoItems = [
      InfoItem(
        label: "Tan Phu, Ho Chi Minh City, Vietnam",
        icon: Assets.svg.icLocation,
        link: "https://maps.app.goo.gl/2q1i7N4U2rPJSU6x9",
      ),
      InfoItem(label: "+84 941 544 797", icon: Assets.svg.icPhone, link: "tel:0941544797"),
      InfoItem(label: "chauductoan@email.com", icon: Assets.svg.icMail, link: "mailto:toanpl060@gmail.com"),
      InfoItem(label: "github.com/ToanChau", icon: Assets.svg.icGithub, link: "https://github.com/ToanChau"),
    ];
    final mobile = Column(
      spacing: context.gap24_16_12,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infoItems.map((e) => Expanded(child: e)).toList(),
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
        print(constrain);
        return constrain.maxWidth < 600 && constrain.maxWidth>588 ;
      },
      desktop: desktop,
    );
  }
}

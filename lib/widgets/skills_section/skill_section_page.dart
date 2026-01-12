import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class SkillSectionPage extends StatelessWidget {
  const SkillSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileTechs = [
      TechTagData(label: 'Flutter', icon: Assets.svg.icFlutter),
      TechTagData(label: 'Dart', icon: Assets.svg.icDart),
      TechTagData(label: 'BLoC', icon: Assets.svg.icDart),
      TechTagData(
        label: 'Clean Architecture',
        // icon: Assets.icons.getx,
      ),
      TechTagData(
        label: 'GoRouter',
        // icon: Assets.icons.provider,
      ),
    ];
    final backendTechs = [
      TechTagData(label: 'Firebase', icon: Assets.svg.icFirebase),
      TechTagData(label: 'SQLite', icon: Assets.svg.icSqlite),
      TechTagData(label: 'REST API', icon: Assets.svg.icApi),
      TechTagData(
        label: 'Hive',
        // icon: Assets.icons.express,
      ),
      TechTagData(label: 'Flask', icon: Assets.svg.icFlask),
    ];
    final tools = [
      TechTagData(label: 'Git', icon: Assets.svg.icGit),
      TechTagData(label: 'Docker', icon: Assets.svg.icDocker),
      TechTagData(label: 'Figma', icon: Assets.svg.icFigma),
      TechTagData(label: 'VS Code', icon: Assets.svg.icVscode),
      TechTagData(label: 'Postman', icon: Assets.svg.icPostman),
      TechTagData(label: 'Android Studio', icon: Assets.svg.icAndroidstudio),
    ];
    final soft = [
      TechTagData(
        label: 'Problem Solving',
        // icon: Assets.icons.react,
      ),
      TechTagData(
        label: 'Communication',
        // icon: Assets.icons.typescript,
      ),
      TechTagData(label: 'Agile/Scrum', icon: Assets.svg.icScrum),
    ];
    final mobileContainer = TechContainer(

      title: "Mobile Development",
      icon: Assets.svg.icMobile,
      technologies: mobileTechs.map((e) => e).toList(),
    );
    final backendContainer = TechContainer(
      hoverColor: const Color(0xFF21CF41),
      title: "Backend Development",
      icon: Assets.svg.icData,
      technologies: backendTechs.map((e) => e).toList(),
    );
    final toolAndDevOps = TechContainer(
      hoverColor: const Color(0xFFF46936),

      title: "Tools & DevOps",
      icon: Assets.svg.icDocker,
      technologies: tools.map((e) => e).toList(),
    );
    final softSkills = TechContainer(
      hoverColor: const Color(0xFF8D37C6),
      title: "Soft Skills",
      icon: Assets.svg.icNotification,
      technologies: soft.map((e) => e).toList(),
    );
    final tablet = IntrinsicHeight(
      child: Row(
        spacing: context.gap24_16_12,
        children: [
          Expanded(
            child: Column(
              spacing: context.gap24_16_12,
              children: [
                Flexible(child: mobileContainer),
                Flexible(child: backendContainer),
              ],
            ),
          ),
          Expanded(
            child: Column(
              spacing: context.gap24_16_12,
              children: [
                Flexible(child: toolAndDevOps),
                Flexible(child: softSkills),
              ],
            ),
          ),
        ],
      ),
    );
    final desktop = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        spacing: context.gap24_16_12,
        children: [
          Expanded(child: mobileContainer),
          Expanded(child: backendContainer),
          Expanded(child: toolAndDevOps),
          Expanded(child: softSkills),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_80_64),
      child: Column(
        children: [
          SectionTag(text: "Skills").marginOnly(bottom: context.gap12_04_04),
          "Technical Expertise"
              .typo({context.heading3Semibold, Typo.color(context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),

          "Technologies and tools I work with"
              .typo({context.heading6Light, Typo.color(context.color.neutral.text.quaternary)})
              .marginOnly(bottom: context.gap80_64_40),
          ResponsiveWidget(
            onCheckAutoLayout: (constrain) => constrain.maxWidth < 825,
            mobile: Column(
              spacing: context.gap24_16_12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [mobileContainer, backendContainer, toolAndDevOps, softSkills],
            ),

            tablet: tablet,

            desktop: desktop,
          ),
        ],
      ),
    );
  }
}

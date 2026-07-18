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
        label: S.of(context).skill_problem_solving,
        // icon: Assets.icons.react,
      ),
      TechTagData(
        label: S.of(context).skill_communication,
        // icon: Assets.icons.typescript,
      ),
      TechTagData(label: 'Agile/Scrum', icon: Assets.svg.icScrum),
    ];
    final isBrutal = context.isBrutal;
    final mobileContainer = TechContainer(
      hoverColor: isBrutal ? BrutalColors.blue : const Color(0xFF06B6D4),
      title: S.of(context).cat_mobile,
      icon: Assets.svg.icMobile,
      technologies: mobileTechs.map((e) => e).toList(),
    );
    final backendContainer = TechContainer(
      hoverColor: isBrutal ? BrutalColors.green : const Color(0xFF21CF41),
      title: S.of(context).cat_backend,
      icon: Assets.svg.icData,
      technologies: backendTechs.map((e) => e).toList(),
    );
    final toolAndDevOps = TechContainer(
      hoverColor: isBrutal ? BrutalColors.orange : const Color(0xFFF46936),
      title: S.of(context).cat_tools,
      icon: Assets.svg.icDocker,
      technologies: tools.map((e) => e).toList(),
    );
    final softSkills = TechContainer(
      hoverColor: isBrutal ? BrutalColors.purple : const Color(0xFF8D37C6),
      title: S.of(context).cat_soft,
      icon: Assets.svg.icNotification,
      technologies: soft.map((e) => e).toList(),
    );
    final tablet = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.gap24_16_12,
      children: [
        Expanded(
          child: Column(
            spacing: context.gap24_16_12,
            children: [
              mobileContainer,
              backendContainer,
            ],
          ),
        ),
        Expanded(
          child: Column(
            spacing: context.gap24_16_12,
            children: [
              toolAndDevOps,
              softSkills,
            ],
          ),
        ),
      ],
    );
    // Không dùng IntrinsicHeight + stretch: Wrap báo sai intrinsic height nên
    // chip cuối ("Android Studio") tràn ra ngoài card. Để card tự cao theo nội dung.
    final desktop = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: context.gap24_16_12,
      children: [
        Expanded(child: mobileContainer),
        Expanded(child: backendContainer),
        Expanded(child: toolAndDevOps),
        Expanded(child: softSkills),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_80_64),
      child: Column(
        children: [
          SectionTag(text: S.of(context).tag_skills).marginOnly(bottom: context.gap12_04_04),
          S.of(context).technical_expertise
              .typo({context.heading3Semibold, Typo.color(context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),

          S.of(context).skills_subtitle
              .typo({
                context.heading6Light,
                Typo.color(isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.quaternary)
              })
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

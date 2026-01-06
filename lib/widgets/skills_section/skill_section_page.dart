import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class SkillSectionPage extends StatelessWidget {
  const SkillSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileTechs = [
      TechTagData(
        label: 'Flutter',
        // icon: Assets.icons.flutter,
      ),
      TechTagData(
        label: 'Dart',
        // icon: Assets.icons.dart,
      ),
      TechTagData(
        label: 'BLoC',
        // icon: Assets.icons.bloc,
      ),
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
      TechTagData(
        label: 'Firebase',
        // icon: Assets.icons.firebase,
      ),
      TechTagData(
        label: 'SQLite',
        // icon: Assets.icons.sqlite,
      ),
      TechTagData(
        label: 'REST API',
        // icon: Assets.icons.nodejs,
      ),
      TechTagData(
        label: 'Hive',
        // icon: Assets.icons.express,
      ),
      TechTagData(
        label: 'Flask',
        // icon: Assets.icons.express,
      ),
    ];
    final tools = [
      TechTagData(
        label: 'Git',
        // icon: Assets.icons.react,
      ),
      TechTagData(
        label: 'Docker',
        // icon: Assets.icons.typescript,
      ),
      TechTagData(
        label: 'Figma',
        // icon: Assets.icons.tailwind,
      ),
      TechTagData(
        label: 'VS Code',
        // icon: Assets.icons.nextjs,
      ),
      TechTagData(
        label: 'Postman',
        // icon: Assets.icons.nextjs,
      ),
      TechTagData(
        label: 'Android Studio',
        // icon: Assets.icons.nextjs,
      ),
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
      TechTagData(
        label: 'Agile/Scrum',
        // icon: Assets.icons.tailwind,
      ),

    ];

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
          TechContainerGrid(
            containers: [
              (title: 'Mobile Development', icon: Assets.svg.icMobile, technologies: mobileTechs),
              (title: 'Backend & Database', icon: Assets.svg.icFirebase, technologies: backendTechs),
              (title: 'Tools & DevOps', icon: Assets.svg.icGithub, technologies: tools),
              (title: 'Soft Skills', icon: Assets.svg.icNotification, technologies: soft),
            ],
            crossAxisCount: 4,
            spacing: context.gap24_16_12,
            hoverColor: const Color(0xFF06B6D4),
            titleColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

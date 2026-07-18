import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class ProjectSectionPage extends StatelessWidget {
  const ProjectSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);
    final projectData = [ProjectCard(
      title: 'CardWords',
      description:
      S.of(context).proj_cardwords_desc,
      imagePath: Assets.png.cardwordslogo.path,
      technologies: ['Flutter', 'Dart', 'BLoC', 'Firebase', 'WebSocket'],
      actions: [
        ProjectAction(
          label: S.of(context).action_code,
          icon: Assets.svg.icGithub,
          link: 'https://github.com/ToanChau/CardWords',
          backgroundColor: isBrutal ? BrutalColors.yellow : cyan,
        ),
        ProjectAction(
          label: S.of(context).action_demo,
          icon: Assets.svg.icRocket,
          link: 'https://drive.google.com/drive/folders/1bGbDjkcAFhw25jWnvjGQUrv0_NIoYvoR?usp=drive_link',
          backgroundColor: isBrutal ? BrutalColors.paper : const Color(0xFF414651),
          textColor: isBrutal ? null : Colors.white,
        ),
      ],
      badge: S.of(context).badge_team_leader,
      badgeColor: isBrutal ? BrutalColors.yellow : cyan,
      hoverColor: isBrutal ? BrutalColors.blue : cyan,
    ),ProjectCard(
      title: 'HUIT E-Learn',
      description:
      S.of(context).proj_elearn_desc,
      imagePath: Assets.png.huitElearn.path,
      // icon: Assets.icons.mobile,
      technologies: ['Flutter', 'Dart', 'BLoC', 'Firebase', 'Flask', 'RAG + LLM'],
      actions: [
        ProjectAction(
          label: S.of(context).action_code,
          icon: Assets.svg.icGithub,
          link: 'https://github.com/ToanChau/HUIT_E-Learn',
          backgroundColor: isBrutal ? BrutalColors.yellow : cyan,
        ),
        ProjectAction(
          label: S.of(context).action_demo,
          icon: Assets.svg.icRocket,
          link: 'https://drive.google.com/drive/folders/1u27IeUYfGw-t6DgR-SJCRnRondjK1CDs?usp=drive_link',
          backgroundColor: isBrutal ? BrutalColors.paper : const Color(0xFF414651),
          textColor: isBrutal ? null : Colors.white,
        ),
      ],
      badge: S.of(context).badge_team_leader,
      badgeColor: isBrutal ? BrutalColors.yellow : cyan,
      hoverColor: isBrutal ? BrutalColors.green : cyan,
    )];
    final desktop =IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.gap24_16_12,
        children: projectData.map((e)=>Expanded(child: e)).toList()

      ),
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_32_16),
      child: Column(
        children: [
          SectionTag(text: S.of(context).tag_projects).marginOnly(bottom: context.gap12_04_04),
          S.of(context).personal_projects
              .typo({context.heading3Semibold, Typo.color(isBrutal ? BrutalColors.ink : context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),
          S.of(context).projects_subtitle
              .typo({
                context.heading6Light,
                Typo.color(isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.quaternary)
              })
              .marginOnly(bottom: context.gap80_64_40),
          ResponsiveWidget(
            // Dưới 700px hai card đứng cạnh nhau sẽ bị bóp méo — chuyển sang xếp dọc.
            onCheckAutoLayout: (constrain) => constrain.maxWidth < 700,
            mobile: Column(
                spacing: context.gap24_16_12,
              children: projectData.map((e)=>e).toList()
            ),
            tablet: desktop,
            desktop: desktop)
        ],
      ),
    );
  }
}

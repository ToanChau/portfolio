import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class ProjectSectionPage extends StatelessWidget {
  const ProjectSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projectData = [ProjectCard(
      title: 'CardWords',
      description:
      'English vocabulary learning app with Tinder-like swipe gestures. Features offline-first architecture and AI-powered recommendations.',
      imagePath: Assets.png.cardwordslogo.path,
      technologies: ['Flutter', 'Dart', 'BLoC', 'Firebase', 'WebSocket'],
      actions: [
        ProjectAction(
          label: 'Code',
          icon: Assets.svg.icGithub,
          link: 'https://github.com/ToanChau/CardWords',
          backgroundColor: const Color(0xFF06B6D4),
        ),
        ProjectAction(
          label: 'Demo',
          icon: Assets.svg.icRocket,
          link: 'https://drive.google.com/drive/folders/1bGbDjkcAFhw25jWnvjGQUrv0_NIoYvoR?usp=drive_link',
          backgroundColor: const Color(0xFF414651),
          textColor: Colors.white,
        ),
      ],
      badge: 'Team Leader',
      badgeColor: const Color(0xFF06B6D4),
      hoverColor: const Color(0xFF06B6D4),
    ),ProjectCard(
      title: 'HUIT E-Learn',
      description:
      'Mobile app for course management with AI-powered test creation using RAG + LLM technology.',
      imagePath: Assets.png.huitElearn.path,
      // icon: Assets.icons.mobile,
      technologies: ['Flutter', 'Dart', 'BLoC', 'Firebase', 'Flask', 'RAG + LLM'],
      actions: [
        ProjectAction(
          label: 'Code',
          icon: Assets.svg.icGithub,
          link: 'https://github.com/ToanChau/HUIT_E-Learn',
          backgroundColor: const Color(0xFF06B6D4),
        ),
        ProjectAction(
          label: 'Demo',
          icon: Assets.svg.icRocket,
          link: 'https://drive.google.com/drive/folders/1u27IeUYfGw-t6DgR-SJCRnRondjK1CDs?usp=drive_link',
          backgroundColor: const Color(0xFF414651),
          textColor: Colors.white,
        ),
      ],
      badge: 'Team Leader',
      badgeColor: const Color(0xFF06B6D4),
      hoverColor: const Color(0xFF06B6D4),
    )];
    final desktop =IntrinsicHeight(
      child: Row(
        spacing: context.gap24_16_12,
        children: projectData.map((e)=>Expanded(child: e)).toList()

      ),
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_32_16),
      child: Column(
        children: [
          SectionTag(text: "Projects").marginOnly(bottom: context.gap12_04_04),
          "Featured Projects"
              .typo({context.heading3Semibold, Typo.color(context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),
          "Showcasing my best work in mobile development"
              .typo({context.heading6Light, Typo.color(context.color.neutral.text.quaternary)})
              .marginOnly(bottom: context.gap80_64_40),
          ResponsiveWidget(
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

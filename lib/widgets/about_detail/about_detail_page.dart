import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_detail/about_detail.dart';
import 'package:shared/shared.dart';
import 'package:resource/resource.dart';

class AboutDetailPage extends StatelessWidget {
  const AboutDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_32_16),
      child: Column(
        children: [
          SectionTag(text: "About Me").marginOnly(bottom: context.gap12_04_04),
          "Who I Am"
              .typo({context.heading3Semibold, Typo.color(context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),

          "Passionate about creating beautiful, functional mobile applications"
              .typo({context.heading6Light, Typo.color(context.color.neutral.text.quaternary)})
              .marginOnly(bottom: context.gap48_40_24),
          ResponsiveWidget(
            onCheckAutoLayout: (constrain){
                return constrain.maxWidth<636;
            },
            mobile: AboutDetailContent(),
            tablet: AboutDetailContent(),
            desktop: Row(
              spacing: context.gap48_40_24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: context.radiusXl,
                    border: Border.all(color: context.color.neutral.border.secondary, width: 1.0),
                  ),
                  child: Assets.png.me2.image(height: 450, fit: BoxFit.fill),
                ),
                Expanded(flex: 3, child: AboutDetailContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

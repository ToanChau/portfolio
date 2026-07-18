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
          SectionTag(text: S.of(context).tag_about_me).marginOnly(bottom: context.gap12_04_04),
          S.of(context).who_i_am
              .typo({context.heading3Semibold, Typo.color(context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),

          S.of(context).about_subtitle
              .typo({
                context.heading6Light,
                Typo.color(context.isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.quaternary)
              })
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
                if (context.isBrutal)
                  Transform.rotate(
                    angle: -2 * 3.14159 / 180,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      decoration: BrutalDecoration.card(
                        color: BrutalColors.paper,
                        borderWidth: 3,
                        radius: 16,
                        shadowOffset: const Offset(8, 8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.png.me2.image(height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  )
                else
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

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return "ToanChau".typo({
      FontFamilyTypo("MeowScript"),
      Typo.w700,
      Typo.size(40),
      Typo.color(context.color.brand.text.enable),
      ShadowsTypo([
        Shadow(
          color: context.color.brand.text.enable.withOpacity(0.8),
          blurRadius: 1,
        ),
      ]
      )
    });
  }
}

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    return "ToanChau".typo({
      FontFamilyTypo("MeowScript"),
      Typo.w700,
      Typo.size(40),
      Typo.color(isBrutal ? BrutalColors.ink : context.color.brand.text.enable),
      ShadowsTypo([
        isBrutal
            ? const Shadow(color: BrutalColors.yellow, offset: Offset(2.5, 2.5))
            : Shadow(color: context.color.brand.text.enable.withOpacity(0.8), blurRadius: 1),
      ])
    });
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';

/// Footer neo-brutalism: khối mực đen tương phản với nền kem,
/// gồm logo + điều hướng + liên hệ + copyright.
class Footer extends StatelessWidget {
  final Function(HeaderMenu)? onMenuTap;

  const Footer({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);
    final mutedText = isBrutal ? BrutalColors.cream.withOpacity(0.7) : Colors.white.withOpacity(0.6);

    final brand = Column(
      crossAxisAlignment: context.isDesktopBreakPoint ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (isBrutal)
          Transform.rotate(
            angle: -2 * math.pi / 180,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
              decoration: BoxDecoration(
                color: BrutalColors.yellow,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: BrutalColors.cream, offset: Offset(4, 4), blurRadius: 0),
                ],
              ),
              child: "ToanChau".typo({
                FontFamilyTypo("MeowScript"),
                Typo.w700,
                Typo.size(36),
                Typo.color(BrutalColors.ink),
              }),
            ),
          )
        else
          "ToanChau".typo({
            FontFamilyTypo("MeowScript"),
            Typo.w700,
            Typo.size(36),
            Typo.color(cyan),
            ShadowsTypo([Shadow(color: cyan.withOpacity(0.8), blurRadius: 1)]),
          }),
        S.of(context).footer_tagline
            .typo({context.paragraph2Regular, Typo.color(mutedText)})
            .paddingOnly(top: context.padding16_08_04),
      ],
    );

    final nav = Wrap(
      alignment: WrapAlignment.center,
      spacing: context.gap24_16_12,
      runSpacing: 8,
      children: HeaderMenu.values
          .map((e) => _FooterLink(label: e.label(context), onTap: () => onMenuTap?.call(e)))
          .toList(),
    );

    final contact = Column(
      crossAxisAlignment: context.isDesktopBreakPoint ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      spacing: 10,
      children: [
        InfoItem(
          label: "toanpl060@gmail.com",
          icon: Assets.svg.icMail,
          link: "mailto:toanpl060@gmail.com",
          textColor: isBrutal ? BrutalColors.cream.withOpacity(0.85) : Colors.white.withOpacity(0.8),
          hoverColor: isBrutal ? BrutalColors.yellow : cyan,
        ),
        InfoItem(
          label: "github.com/ToanChau",
          icon: Assets.svg.icGithub,
          link: "https://github.com/ToanChau",
          textColor: isBrutal ? BrutalColors.cream.withOpacity(0.85) : Colors.white.withOpacity(0.8),
          hoverColor: isBrutal ? BrutalColors.yellow : cyan,
        ),
        InfoItem(
          label: S.of(context).footer_address_short,
          icon: Assets.svg.icLocation,
          link: "https://www.google.com/maps/search/?api=1&query=Thu+Duc,+Ho+Chi+Minh+City,+Vietnam",
          textColor: isBrutal ? BrutalColors.cream.withOpacity(0.85) : Colors.white.withOpacity(0.8),
          hoverColor: isBrutal ? BrutalColors.yellow : cyan,
        ),
      ],
    );

    final columns = context.isDesktopBreakPoint
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: brand),
              Expanded(child: Center(child: nav)),
              Expanded(child: Align(alignment: Alignment.centerRight, child: contact)),
            ],
          )
        : Column(
            spacing: context.gap24_16_12,
            children: [brand, nav, contact],
          );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isBrutal ? BrutalColors.ink : const Color(0xFF1B1D22),
        border: Border(
          top: isBrutal
              ? const BorderSide(color: BrutalColors.yellow, width: 4)
              : BorderSide(color: cyan.withOpacity(0.4), width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.padding48_32_24,
        horizontal: context.padding128_32_16,
      ),
      child: Column(
        children: [
          columns,
          Container(
            height: isBrutal ? 2 : 1,
            margin: EdgeInsets.symmetric(vertical: context.gap24_16_12),
            color: (isBrutal ? BrutalColors.cream : Colors.white).withOpacity(0.15),
          ),
          S.of(context).footer_copyright
              .typo({context.caption1Regular, Typo.color(mutedText)}),
        ],
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const _FooterLink({required this.label, this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: isBrutal && _hovered
              ? BrutalDecoration.flatChip(color: BrutalColors.yellow, borderWidth: 2, radius: 8)
              : BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: isBrutal
                  ? (_hovered ? BrutalColors.ink : BrutalColors.cream)
                  : (_hovered ? cyan : Colors.white.withOpacity(0.8)),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

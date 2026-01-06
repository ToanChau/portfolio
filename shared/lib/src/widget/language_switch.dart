import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LanguageSwitch extends StatefulWidget {
  final String? initialLanguage;
  final Function(bool isVieSelected)? onLanguageChanged;

  const LanguageSwitch({
    super.key,
    this.onLanguageChanged,
    this.initialLanguage,
  });

  @override
  _LanguageSwitchState createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isVieSelected = true;

  @override
  void initState() {
    if (widget.initialLanguage != null) {
      isVieSelected = widget.initialLanguage!.toLowerCase() == 'vi';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsiveValue(desktop: 78, tablet: 76, fallback: 76),
      height: 32,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: context.color.neutral.surface.secondary,
        borderRadius: context.radiusSm2,
      ),
      child: Row(
        spacing: context.gap06_04_02,
        children: [
          Expanded(
            child: _TextContent(
              content: "Vi",
              isSelected: isVieSelected,
              onTap: () {
                setState(() {
                  isVieSelected = true;
                  widget.onLanguageChanged?.call(isVieSelected);
                });
              },
            ),
          ),
          Expanded(
            child: _TextContent(
              content: "En",
              isSelected: !isVieSelected,
              onTap: () {
                setState(() {
                  isVieSelected = false;
                  widget.onLanguageChanged?.call(isVieSelected);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TextContent extends StatefulWidget {
  final String content;
  final bool isSelected;
  final VoidCallback onTap;

  const _TextContent({
    required this.content,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<_TextContent> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      onHover: (value) {
        if (value && widget.isSelected) return;
        setState(() {
          _hovering = value;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 7.0),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? context.color.brand.surface.primary
              : Colors.transparent,
          border: Border.all(
            color: _hovering && !widget.isSelected
                ? context.color.neutral.border.primary
                : Colors.transparent,
          ),
          borderRadius: context.radiusSm,
        ),
        child: widget.content.typo({
          widget.isSelected ? context.caption2Semibold : context.caption2Medium,
          Typo.color(
            widget.isSelected
                ? context.color.neutral.text.onButton
                : context.color.neutral.text.primary,
          )
        }),
      ),
    );
  }
}

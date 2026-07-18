import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/brutal.dart';
import '../theme/design_mode.dart';
import 'tilt_card.dart';

/// Data class cho Tech Tag
class TechTagData {
  final String label;
  final SvgGenImage? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final String? link;
  final VoidCallback? onTap;

  const TechTagData({
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.link,
    this.onTap,
  });
}

/// Tech Tag Widget - hiển thị một công nghệ
class TechTag extends StatefulWidget {
  final String label;
  final SvgGenImage? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? hoverColor;
  final String? link;
  final VoidCallback? onTap;
  final double fontSize;
  final double iconSize;
  final EdgeInsets padding;
  final double borderRadius;

  const TechTag({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.hoverColor,
    this.link,
    this.onTap,
    this.fontSize = 13,
    this.iconSize = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.borderRadius = 8,
  });

  factory TechTag.fromData(
    TechTagData data, {
    Color? hoverColor,
    double fontSize = 13,
    double iconSize = 16,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    double borderRadius = 8,
  }) {
    return TechTag(
      label: data.label,
      icon: data.icon,
      backgroundColor: data.backgroundColor,
      textColor: data.textColor,
      borderColor: data.borderColor,
      hoverColor: hoverColor,
      link: data.link,
      onTap: data.onTap,
      fontSize: fontSize,
      iconSize: iconSize,
      padding: padding,
      borderRadius: borderRadius,
    );
  }

  @override
  State<TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<TechTag> {
  bool _isHovered = false;

  Future<void> _handleTap() async {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }

    if (widget.link != null && widget.link!.isNotEmpty) {
      final uri = Uri.parse(widget.link!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    final hasAction = widget.link != null || widget.onTap != null;

    final defaultBgColor = widget.backgroundColor ?? (isBrutal ? BrutalColors.paper : const Color(0xFF2A3038));
    final defaultTextColor =
        widget.textColor ?? (isBrutal ? BrutalColors.ink : Colors.white.withOpacity(0.8));
    final defaultBorderColor = widget.borderColor ?? const Color(0xFF414651);
    final hoverColor = widget.hoverColor ?? (isBrutal ? BrutalColors.yellow : const Color(0xFF06B6D4));

    // Classic: hover đổi màu chữ/viền sang cyan. Brutal: hover đổi nền —
    // nhưng chỉ khi tag thật sự bấm được, hover giả trên item tĩnh khiến
    // người dùng tưởng là link.
    final showHover = _isHovered && (hasAction || !isBrutal);
    final contentColor = !isBrutal && showHover ? hoverColor : defaultTextColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: hasAction ? _handleTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding,
          decoration: isBrutal
              ? BrutalDecoration.flatChip(
                  color: showHover ? hoverColor : defaultBgColor,
                  borderWidth: 2,
                  radius: widget.borderRadius,
                )
              : BoxDecoration(
                  color: showHover ? hoverColor.withOpacity(0.15) : defaultBgColor,
                  border: Border.all(
                    color: showHover ? hoverColor : defaultBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              if (widget.icon != null) ...[
                widget.icon!.svg(
                  width: widget.iconSize,
                  height: widget.iconSize,
                  colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
              ],

              // Label. Flexible + ellipsis: a Wrap hands each tag the full line
              // width, so a long label ("Clean Architecture") would otherwise
              // overflow the row once the column gets narrow.
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    color: contentColor,
                    fontSize: widget.fontSize,
                    fontWeight: isBrutal ? FontWeight.w600 : FontWeight.w500,
                  ),
                  child: Text(widget.label, maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tech Stack Widget - hiển thị danh sách công nghệ với auto-wrap
class TechStack extends StatelessWidget {
  final List<TechTagData> technologies;
  final String? title;
  final double spacing;
  final double runSpacing;
  final Color? hoverColor;
  final Color? titleColor;
  final double titleFontSize;
  final double tagFontSize;
  final double tagIconSize;
  final EdgeInsets tagPadding;
  final double tagBorderRadius;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;

  const TechStack({
    super.key,
    required this.technologies,
    this.title,
    this.spacing = 12,
    this.runSpacing = 12,
    this.hoverColor,
    this.titleColor,
    this.titleFontSize = 16,
    this.tagFontSize = 13,
    this.tagIconSize = 16,
    this.tagPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.tagBorderRadius = 8,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              color: titleColor ?? BrutalColors.ink,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
        ],

        // Tech Tags - Auto wrap
        Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          alignment: alignment,
          crossAxisAlignment: crossAxisAlignment,
          children: technologies.map((tech) {
            return TechTag.fromData(
              tech,
              hoverColor: hoverColor,
              fontSize: tagFontSize,
              iconSize: tagIconSize,
              padding: tagPadding,
              borderRadius: tagBorderRadius,
            );
          }).toList(),
        ),
      ],
    );
  }
}


class TechContainer extends StatefulWidget {
  final List<TechTagData> technologies;
  final String? title;
  final SvgGenImage? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final Color? hoverColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets padding;
  final double spacing;
  final double runSpacing;
  final double titleFontSize;
  final double tagFontSize;
  final double tagIconSize;
  final bool showHoverEffect;
  final VoidCallback? onHover;

  const TechContainer({
    super.key,
    required this.technologies,
    this.title,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.titleColor,
    this.hoverColor,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.all(24),
    this.spacing = 12,
    this.runSpacing = 12,
    this.titleFontSize = 18,
    this.tagFontSize = 13,
    this.tagIconSize = 16,
    this.showHoverEffect = true,
    this.onHover,
  });

  @override
  State<TechContainer> createState() => _TechContainerState();
}

class _TechContainerState extends State<TechContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    final defaultTitleColor = isBrutal ? BrutalColors.ink : Colors.white;
    final accentColor = widget.hoverColor ?? (isBrutal ? BrutalColors.yellow : const Color(0xFF06B6D4));
    final lifted = _isHovered && widget.showHoverEffect;

    Widget card = MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onHover?.call();
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: isBrutal ? 150 : 300),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
            isBrutal && lifted ? -3 : 0, isBrutal && lifted ? -3 : 0, 0),
        decoration: isBrutal
            ? BrutalDecoration.card(
                color: widget.backgroundColor ?? BrutalColors.paper,
                borderWidth: 3,
                radius: widget.borderRadius,
                shadowOffset: lifted ? const Offset(9, 9) : const Offset(6, 6),
              )
            : BoxDecoration(
                color: widget.backgroundColor ?? const Color(0xFF1A1F28),
                border: Border.all(
                  color: lifted ? accentColor : (widget.borderColor ?? const Color(0xFF414651)),
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: lifted
                    ? [
                        BoxShadow(
                          color: accentColor.withOpacity(0.3),
                          blurRadius: 32,
                          spreadRadius: -4,
                          offset: const Offset(0, 14),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and title.
            //
            // The icon is a fixed 48px box, so below roughly 64px of content
            // width the Expanded title collapses to zero and the icon alone
            // overflows the row. Drop the icon rather than overflow, and cap
            // the title so a narrow column wraps it instead of laying it out
            // one character per line.
            if (widget.title != null || widget.icon != null) ...[
              LayoutBuilder(
                builder: (context, constraints) {
                  final hasRoomForIcon = widget.icon != null && constraints.maxWidth >= 120;

                  return Row(
                    children: [
                      if (hasRoomForIcon) ...[
                        Container(
                          width: 48,
                          height: 48,
                          decoration: isBrutal
                              ? BrutalDecoration.flatChip(
                                  color: accentColor,
                                  borderWidth: 2,
                                  radius: 12,
                                )
                              : BoxDecoration(
                                  color: accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: accentColor.withOpacity(0.3), width: 1),
                                ),
                          child: Center(
                            child: widget.icon!.svg(
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                isBrutal ? BrutalColors.ink : accentColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],

                      // Title
                      if (widget.title != null)
                        Expanded(
                          child: Text(
                            widget.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: widget.titleColor ?? defaultTitleColor,
                              fontSize: widget.titleFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],

            // Tech Stack
            Wrap(
              spacing: widget.spacing,
              runSpacing: widget.runSpacing,
              children: widget.technologies.map((tech) {
                return TechTag.fromData(
                  tech,
                  hoverColor: widget.hoverColor,
                  fontSize: widget.tagFontSize,
                  iconSize: widget.tagIconSize,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );

    if (!isBrutal) {
      card = TiltCard(
        maxTilt: widget.showHoverEffect ? 5 : 0,
        hoverLift: widget.showHoverEffect ? 8 : 0,
        glareColor: widget.showHoverEffect ? const Color(0x1AFFFFFF) : null,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: card,
      );
    }
    return card;
  }
}


class TechContainerGrid extends StatelessWidget {
  final List<({
  String? title,
  SvgGenImage? icon,
  List<TechTagData> technologies,
  })> containers;
  final int crossAxisCount;
  final double spacing;
  final Color? hoverColor;
  final Color? titleColor;

  const TechContainerGrid({
    super.key,
    required this.containers,
    this.crossAxisCount = 2,
    this.spacing = 24,
    this.hoverColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int columns = crossAxisCount;

    if (screenWidth < 480) {
      columns = 1;
    } else if (screenWidth < 768) {
      columns = 1;
    } else if (screenWidth < 1024) {
      columns = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: 1,
      ),
      itemCount: containers.length,
      itemBuilder: (context, index) {
        final container = containers[index];
        return IntrinsicHeight(
          child: TechContainer(
            title: container.title,
            icon: container.icon,
            technologies: container.technologies,
            hoverColor: hoverColor,
            titleColor: titleColor,
          ),
        );
      },
    );
  }
}

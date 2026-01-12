import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final hasAction = widget.link != null || widget.onTap != null;
    final defaultBgColor = const Color(0xFF2A3038);
    final defaultTextColor = Colors.white.withOpacity(0.8);
    final defaultBorderColor = const Color(0xFF414651);
    final defaultHoverColor = const Color(0xFF06B6D4);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: hasAction ? _handleTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.hoverColor ?? defaultHoverColor).withOpacity(0.15)
                : (widget.backgroundColor ?? defaultBgColor),
            border: Border.all(
              color: _isHovered ? (widget.hoverColor ?? defaultHoverColor) : (widget.borderColor ?? defaultBorderColor),
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
                  colorFilter: ColorFilter.mode(
                    _isHovered ? (widget.hoverColor ?? defaultHoverColor) : (widget.textColor ?? defaultTextColor),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
              ],

              // Label
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: _isHovered ? (widget.hoverColor ?? defaultHoverColor) : (widget.textColor ?? defaultTextColor),
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                ),
                child: Text(widget.label),
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
              color: titleColor ?? Colors.white,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
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
    final defaultBgColor = const Color(0xFF1A1F28);
    final defaultBorderColor = const Color(0xFF414651);
    final defaultTitleColor = Colors.white;
    final defaultHoverColor = const Color(0xFF06B6D4);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onHover?.call();
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? defaultBgColor,
          border: Border.all(
            color: _isHovered && widget.showHoverEffect
                ? (widget.hoverColor ?? defaultHoverColor)
                : (widget.borderColor ?? defaultBorderColor),
            width: widget.borderWidth,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _isHovered && widget.showHoverEffect
              ? [
            BoxShadow(
              color: (widget.hoverColor ?? defaultHoverColor)
                  .withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
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
            // Header with icon and title
            if (widget.title != null || widget.icon != null) ...[
              Row(
                children: [
                  // Icon
                  if (widget.icon != null) ...[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: (widget.hoverColor ?? defaultHoverColor)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: (widget.hoverColor ?? defaultHoverColor)
                              .withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: widget.icon!.svg(
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                            widget.hoverColor ?? defaultHoverColor,
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
                        style: TextStyle(
                          color: widget.titleColor ?? defaultTitleColor,
                          fontSize: widget.titleFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
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

import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/brutal.dart';
import '../theme/design_mode.dart';
import 'tilt_card.dart';

/// Data class cho Project Card
class ProjectCardData {
  final String title;
  final String description;
  final String? imagePath; // Assets.png
  final SvgGenImage? icon;
  final List<String> technologies;
  final List<ProjectAction> actions;
  final String? badge;
  final Color? badgeColor;

  const ProjectCardData({
    required this.title,
    required this.description,
    this.imagePath,
    this.icon,
    required this.technologies,
    required this.actions,
    this.badge,
    this.badgeColor,
  });
}

/// Project Action (Code, Demo, Video, etc.)
class ProjectAction {
  final String label;
  final SvgGenImage? icon;
  final String? link;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const ProjectAction({
    required this.label,
    this.icon,
    this.link,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });
}

/// Project Card Widget
class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? imagePath;
  final SvgGenImage? icon;
  final List<String> technologies;
  final List<ProjectAction> actions;
  final String? badge;
  final Color? badgeColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hoverColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets padding;
  final double imageHeight;
  final double iconSize;
  final bool showHoverEffect;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
    this.icon,
    required this.technologies,
    required this.actions,
    this.badge,
    this.badgeColor,
    this.backgroundColor,
    this.borderColor,
    this.hoverColor,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.all(20),
    this.imageHeight = 200,
    this.iconSize = 48,
    this.showHoverEffect = true,
  });

  factory ProjectCard.fromData(
      ProjectCardData data, {
        Color? backgroundColor,
        Color? borderColor,
        Color? hoverColor,
        double borderRadius = 16,
        double borderWidth = 1,
        EdgeInsets padding = const EdgeInsets.all(20),
        double imageHeight = 200,
        double iconSize = 48,
        bool showHoverEffect = true,
      }) {
    return ProjectCard(
      title: data.title,
      description: data.description,
      imagePath: data.imagePath,
      icon: data.icon,
      technologies: data.technologies,
      actions: data.actions,
      badge: data.badge,
      badgeColor: data.badgeColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      hoverColor: hoverColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      imageHeight: imageHeight,
      iconSize: iconSize,
      showHoverEffect: showHoverEffect,
    );
  }

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    final defaultHoverColor = isBrutal ? BrutalColors.blue : const Color(0xFF06B6D4);
    final accent = widget.hoverColor ?? defaultHoverColor;
    final lifted = _isHovered && widget.showHoverEffect;

    Widget card = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
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
                shadowOffset: lifted ? const Offset(10, 10) : const Offset(7, 7),
              )
            : BoxDecoration(
                color: widget.backgroundColor ?? const Color(0xFF1A1F28),
                border: Border.all(
                  color: lifted ? accent : (widget.borderColor ?? const Color(0xFF414651)),
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: lifted
                    ? [
                        BoxShadow(
                          color: accent.withOpacity(0.35),
                          blurRadius: 40,
                          spreadRadius: -4,
                          offset: const Offset(0, 18),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image/Icon Header
            _buildImageHeader(defaultHoverColor),

            // Content
            Padding(
              padding: widget.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.badge != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: isBrutal
                              ? BrutalDecoration.flatChip(
                                  color: widget.badgeColor ?? BrutalColors.yellow,
                                  borderWidth: 2,
                                  radius: 6,
                                )
                              : BoxDecoration(
                                  color: (widget.badgeColor ?? accent).withOpacity(0.2),
                                  border: Border.all(color: widget.badgeColor ?? accent, width: 0.5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 12,
                                color: isBrutal ? BrutalColors.ink : (widget.badgeColor ?? accent),
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  widget.badge!,
                                  style: TextStyle(
                                    color: isBrutal ? BrutalColors.ink : (widget.badgeColor ?? accent),
                                    fontSize: 11,
                                    fontWeight: isBrutal ? FontWeight.w700 : FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: isBrutal ? BrutalColors.ink : Colors.white,
                            fontSize: isBrutal ? 19 : 18,
                            fontWeight: isBrutal ? FontWeight.w700 : FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: isBrutal ? BrutalColors.inkSoft : Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 16),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: isBrutal
                            ? BrutalDecoration.flatChip(
                                color: BrutalColors.cream,
                                borderWidth: 1.5,
                                radius: 6,
                              )
                            : BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            color: isBrutal ? BrutalColors.ink : Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: isBrutal ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  // Actions
                  Row(
                    children: widget.actions.map((action) {
                      return Flexible(child: _buildActionButton(action, defaultHoverColor));
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (!isBrutal) {
      card = TiltCard(
        maxTilt: widget.showHoverEffect ? 6 : 0,
        hoverLift: widget.showHoverEffect ? 12 : 0,
        glareColor: widget.showHoverEffect ? const Color(0x1FFFFFFF) : null,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: card,
      );
    }
    return card;
  }

  Widget _buildImageHeader(Color defaultHoverColor) {
    final isBrutal = context.isBrutal;
    final accent = widget.hoverColor ?? defaultHoverColor;

    if (!isBrutal) {
      return Container(
        height: widget.imageHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.borderRadius),
            topRight: Radius.circular(widget.borderRadius),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.imagePath != null)
              Image.asset(
                widget.imagePath!,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              )
            else
              Container(color: Colors.black.withOpacity(0.5)),
            if (widget.icon != null)
              Container(
                width: widget.iconSize + 20,
                height: widget.iconSize + 20,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.15),
                  border: Border.all(color: accent.withOpacity(0.3), width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: widget.icon!.svg(
                    width: widget.iconSize,
                    height: widget.iconSize,
                    colorFilter: ColorFilter.mode(accent, BlendMode.srcIn),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return Container(
      height: widget.imageHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius - 3),
          topRight: Radius.circular(widget.borderRadius - 3),
        ),
        border: const Border(
          bottom: BorderSide(color: BrutalColors.ink, width: 3),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          if (widget.imagePath != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                widget.imagePath!,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

          // Icon Overlay
          if (widget.icon != null)
            Container(
              width: widget.iconSize + 20,
              height: widget.iconSize + 20,
              decoration: BrutalDecoration.flatChip(
                color: BrutalColors.paper,
                borderWidth: 2,
                radius: 12,
              ),
              child: Center(
                child: widget.icon!.svg(
                  width: widget.iconSize,
                  height: widget.iconSize,
                  colorFilter: const ColorFilter.mode(
                    BrutalColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton(ProjectAction action, Color defaultHoverColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: _ActionButton(
        label: action.label,
        icon: action.icon,
        link: action.link,
        onTap: action.onTap,
        backgroundColor: action.backgroundColor,
        textColor: action.textColor,
        hoverColor: widget.hoverColor ?? defaultHoverColor,
      ),
    );
  }
}

/// Action Button Widget
class _ActionButton extends StatefulWidget {
  final String label;
  final SvgGenImage? icon;
  final String? link;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color hoverColor;

  const _ActionButton({
    required this.label,
    this.icon,
    this.link,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.hoverColor,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
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
    final defaultBgColor = isBrutal ? BrutalColors.yellow : const Color(0xFF06B6D4);
    final defaultTextColor = isBrutal ? BrutalColors.ink : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: hasAction ? _handleTap : null,
        child: AnimatedContainer(
          duration: Duration(milliseconds: isBrutal ? 120 : 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
              isBrutal && _isHovered ? 2 : 0, isBrutal && _isHovered ? 2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: isBrutal
              ? BrutalDecoration.card(
                  color: widget.backgroundColor ?? defaultBgColor,
                  borderWidth: 2,
                  radius: 8,
                  shadowOffset: _isHovered ? const Offset(1, 1) : const Offset(3, 3),
                )
              : BoxDecoration(
                  color: _isHovered
                      ? (widget.backgroundColor ?? defaultBgColor).withOpacity(0.9)
                      : (widget.backgroundColor ?? defaultBgColor),
                  borderRadius: BorderRadius.circular(8),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Flexible(
                  child: widget.icon!.svg(
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      widget.textColor ?? defaultTextColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.textColor ?? defaultTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Project Grid Widget - hiển thị nhiều project cards
class ProjectGrid extends StatelessWidget {
  final List<ProjectCardData> projects;
  final int crossAxisCount;
  final double spacing;
  final Color? hoverColor;

  const ProjectGrid({
    super.key,
    required this.projects,
    this.crossAxisCount = 2,
    this.spacing = 24,
    this.hoverColor,
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
        childAspectRatio: 0.85,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard.fromData(
          projects[index],
          hoverColor: hoverColor,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class StatusBadge extends StatefulWidget {
  final String text;
  final Color? dotColor;
  final bool showDot;

  const StatusBadge({
    super.key,
    required this.text,
    this.dotColor,
    this.showDot = true,
  });

  @override
  State<StatusBadge> createState() => _StatusBadgeState();
}

class _StatusBadgeState extends State<StatusBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.4, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const brandColor = Color(0xFF06B6D4);
    final dotColor = widget.dotColor ?? const Color(0xFF10B981);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: isBrutal ? 12 : 7, vertical: 6),
          decoration: isBrutal
              ? BrutalDecoration.chip(
                  color: BrutalColors.paper,
                  borderWidth: 2,
                  radius: 100,
                  shadowOffset: const Offset(3, 3),
                )
              : BoxDecoration(
                  color: brandColor.withOpacity(0.1),
                  border: Border.all(color: brandColor.withOpacity(0.2), width: 2),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: brandColor.withOpacity(0.2 * _animation.value),
                      blurRadius: 8 * _animation.value,
                      spreadRadius: 2,
                    ),
                  ],
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showDot) ...[
                FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: isBrutal ? 8 : 7,
                    height: isBrutal ? 8 : 7,
                    decoration: BoxDecoration(
                      color: isBrutal ? BrutalColors.green : dotColor,
                      shape: BoxShape.circle,
                      border: isBrutal ? Border.all(color: BrutalColors.ink, width: 1.5) : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: isBrutal
                    ? widget.text.typo({context.caption1Medium, Typo.color(BrutalColors.ink)})
                    : widget.text.typo({context.caption1Light, Typo.color(brandColor)}),
              ),
            ],
          ),
        );
      },
    );
  }
}


class SectionTag extends StatelessWidget {
  final String text;

  const SectionTag({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const brandColor = Color(0xFF06B6D4);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: isBrutal
          ? BrutalDecoration.chip(
              color: BrutalColors.yellow,
              borderWidth: 2,
              radius: 100,
              shadowOffset: const Offset(3, 3),
            )
          : BoxDecoration(
              color: brandColor.withOpacity(0.1),
              border: Border.all(color: brandColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(100),
            ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isBrutal ? FontWeight.w700 : FontWeight.w500,
          color: isBrutal ? BrutalColors.ink : brandColor,
        ),
      ),
    );
  }
}

/// Skill Tag - dùng cho các tag nhỏ như "Flutter", "Dart", "BLoC"
class SkillTag extends StatefulWidget {
  final String text;

  const SkillTag({
    super.key,
    required this.text,
  });

  @override
  State<SkillTag> createState() => _SkillTagState();
}

class _SkillTagState extends State<SkillTag> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BrutalDecoration.flatChip(
          color: _hovering ? BrutalColors.yellow : BrutalColors.cream,
          borderWidth: 1.5,
          radius: 6,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 12,
            color: BrutalColors.ink,
          ),
        ),
      ),
    );
  }
}

/// Tech Tag - dùng cho project cards
// class TechTag extends StatelessWidget {
//   final String text;
//
//   const TechTag({
//     super.key,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     const gray900 = Color(0xFF272C35);
//     const gray800 = Color(0xFF414651);
//     const gray400 = Color(0xFFD5D7DA);
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: gray900,
//         border: Border.all(color: gray800),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 11,
//           color: gray400,
//         ),
//       ),
//     );
//   }
// }

/// Project Badge - dùng cho "Team Leader" badge trong project cards
class ProjectBadge extends StatelessWidget {
  final String text;
  final IconData? icon;

  const ProjectBadge({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BrutalDecoration.flatChip(
        color: BrutalColors.paper,
        borderWidth: 1.5,
        radius: 6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: BrutalColors.ink),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: BrutalColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineDateBadge extends StatelessWidget {
  final String text;

  const TimelineDateBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BrutalDecoration.flatChip(
        color: BrutalColors.blue,
        borderWidth: 1.5,
        radius: 6,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: BrutalColors.ink,
        ),
      ),
    );
  }
}

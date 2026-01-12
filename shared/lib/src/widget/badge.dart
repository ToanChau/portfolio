import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/theme/color/color.dart';

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
    const brandColor = ColorAlias.brand500;
    final dotColor = widget.dotColor ?? const Color(0xFF10B981);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          decoration: BoxDecoration(
            color: brandColor.withOpacity(0.1),
            border: Border.all(color: brandColor.withOpacity(0.2),width: 2),
            borderRadius: context.radius6xl,
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
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Flexible(child: widget.text.typo({context.caption1Light,Typo.color(brandColor)}))

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
    const brandColor = Color(0xFF06B6D4);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: brandColor.withOpacity(0.1),
        border: Border.all(color: brandColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: brandColor,
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
    const gray900 = Color(0xFF272C35);
    const gray800 = Color(0xFF414651);
    const gray400 = Color(0xFFD5D7DA);
    const white = Color(0xFFFFFFFF);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hovering ? gray800 : gray900,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 12,
            color: _hovering ? white : gray400,
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
    const gray900 = Color(0xFF272C35);
    const gray400 = Color(0xFFD5D7DA);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: gray900,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: gray400),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: gray400,
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
    const brandColor = Color(0xFF06B6D4);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: brandColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: brandColor,
        ),
      ),
    );
  }
}

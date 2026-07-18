import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';

/// Nút chuyển qua lại giữa hai design system (classic dark / neo-brutalism).
/// Tự đổi diện mạo theo mode hiện tại.
class DesignToggle extends StatefulWidget {
  const DesignToggle({super.key});

  @override
  State<DesignToggle> createState() => _DesignToggleState();
}

class _DesignToggleState extends State<DesignToggle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);

    return Tooltip(
      message: isBrutal ? S.of(context).tooltip_switch_classic : S.of(context).tooltip_switch_brutal,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            final mode = DesignModeScope.of(context);
            mode.value = isBrutal ? DesignSystem.classic : DesignSystem.brutal;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: isBrutal
                ? BrutalDecoration.chip(
                    color: _hovered ? BrutalColors.yellow : BrutalColors.paper,
                    borderWidth: 2,
                    radius: 100,
                    shadowOffset: _hovered ? const Offset(1, 1) : const Offset(3, 3),
                  )
                : BoxDecoration(
                    color: cyan.withOpacity(_hovered ? 0.25 : 0.1),
                    border: Border.all(color: cyan.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(100),
                  ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.palette_outlined,
                  size: 16,
                  color: isBrutal ? BrutalColors.ink : cyan,
                ),
                const SizedBox(width: 6),
                Text(
                  isBrutal ? "Neo" : "Dark",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: isBrutal ? BrutalColors.ink : cyan,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

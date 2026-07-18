import 'package:flutter/material.dart';
import 'package:portfolio/widgets/locale_scope.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';

/// Nút chuyển ngôn ngữ EN/VI, cùng ngôn ngữ hình ảnh với DesignToggle.
class LangToggle extends StatefulWidget {
  const LangToggle({super.key});

  @override
  State<LangToggle> createState() => _LangToggleState();
}

class _LangToggleState extends State<LangToggle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);
    final locale = LocaleScope.of(context);
    final isVi = locale.value.languageCode == 'vi';

    return Tooltip(
      message: S.of(context).tooltip_switch_language,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => locale.value = Locale(isVi ? 'en' : 'vi'),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: isBrutal
                ? BrutalDecoration.chip(
                    color: _hovered ? BrutalColors.blue : BrutalColors.paper,
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
                  Icons.translate_rounded,
                  size: 16,
                  color: isBrutal ? BrutalColors.ink : cyan,
                ),
                const SizedBox(width: 6),
                Text(
                  isVi ? "VI" : "EN",
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

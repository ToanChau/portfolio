import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';

enum ButtonType { filled, outlined, tonal }

enum ButtonSize { xl, lg, xs }

class Button extends StatefulWidget {
  final ButtonType type;
  final ButtonSize size;
  final String? content;
  final SvgGenImage? icon;
  final Function()? onPressed;
  final bool iconOnly;
  final bool enabled;

  const Button({
    super.key,
    this.content,
    this.icon,
    required this.type,
    required this.size,
    this.onPressed,
    this.iconOnly = false,
    this.enabled = true,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovering ? -2.0 : 0, 0),
        child: InkWell(
          onTap: widget.enabled ? widget.onPressed : null,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: border,
              borderRadius: borderRadius,
              boxShadow: _hovering && widget.enabled
                  ? [
                      BoxShadow(
                        color: context.color.brand.surface.enable.withOpacity(0.3),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null)
                  widget.icon!.svg(
                    width: 20.0,
                    height: 20.0,
                    colorFilter: ColorFilter.mode(
                      iconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                if (!widget.iconOnly)
                  Flexible(
                    child: (widget.content ?? "").typo({
                      context.paragraph2Semibold,
                      Typo.color(contentColor),
                    }).marginOnly(left: !widget.iconOnly ? 12.0 : 0.0),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get labelOnly => widget.icon != null;

  EdgeInsets get padding {
    if (widget.iconOnly) {
      return switch (widget.size) {
        ButtonSize.xl => const EdgeInsets.all(14),
        ButtonSize.lg => const EdgeInsets.all(10),
        ButtonSize.xs => const EdgeInsets.all(6),
      };
    }
    return switch (widget.size) {
      ButtonSize.xl => EdgeInsets.only(
          top: 14.0,
          bottom: 14.0,
          left: 28.0,
          right: labelOnly ? 28 : 20.0,
        ),
      ButtonSize.lg => EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 16.0,
          right: labelOnly ? 16 : 12.0,
        ),
      ButtonSize.xs => EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          left: 12.0,
          right: labelOnly ? 12 : 8.0,
        ),
    };
  }

  BorderRadius get borderRadius {
    return switch (widget.size) {
      ButtonSize.xl => context.radiusXl,
      ButtonSize.lg => context.radiusLg,
      ButtonSize.xs => context.radiusMd,
    };
  }

  Color get backgroundColor {
    if (!widget.enabled) return context.color.brand.surface.disable;
    return switch (widget.type) {
      ButtonType.filled => _hovering ? context.color.brand.surface.hover : context.color.brand.surface.enable,
      ButtonType.outlined => Colors.transparent,
      ButtonType.tonal => _hovering ? context.color.neutral.surface.active : context.color.neutral.surface.focus,
    };
  }

  Border? get border {
    return switch (widget.type) {
      ButtonType.filled => null,
      ButtonType.outlined => Border.all(
          color: _hovering ? context.color.brand.border.hover : context.color.neutral.border.primary,
          width: 1.0,
        ),
      ButtonType.tonal => null,
    };
  }

  Color get contentColor {
    if (!widget.enabled) return context.color.brand.icon.disable;
    return switch (widget.type) {
      ButtonType.filled => context.color.brand.text.onButton,
      ButtonType.outlined => context.color.neutral.text.primary,
      ButtonType.tonal => context.color.brand.text.onButtonAllWhite,
    };
  }

  Color get iconColor {
    if (!widget.enabled) return context.color.brand.icon.disable;
    return switch (widget.type) {
      ButtonType.filled => context.color.brand.icon.onButton,
      ButtonType.outlined => context.color.neutral.icon.primary,
      ButtonType.tonal => context.color.brand.icon.onButton,
    };
  }
}

class ButtonNeutral extends StatefulWidget {
  final ButtonType type;
  final ButtonSize size;
  final String? content;
  final SvgGenImage? icon;
  final Function()? onPressed;
  final bool iconOnly;
  final bool enabled;

  const ButtonNeutral({
    super.key,
    this.content,
    this.icon,
    required this.type,
    required this.size,
    this.onPressed,
    this.iconOnly = false,
    this.enabled = true,
  });

  @override
  State<ButtonNeutral> createState() => _ButtonNeutralState();
}

class _ButtonNeutralState extends State<ButtonNeutral> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovering ? -2.0 : 0, 0),
        child: InkWell(
          onTap: widget.enabled ? widget.onPressed : null,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: border,
              borderRadius: borderRadius,
              boxShadow: _hovering && widget.enabled && widget.type == ButtonType.filled
                  ? [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.15),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.iconOnly)
                  (widget.content ?? "").typo({
                    context.paragraph1Semibold,
                    Typo.color(contentColor),
                  }),
                if (widget.icon != null)
                  widget.icon!
                      .svg(
                        width: 20.0,
                        height: 20.0,
                        colorFilter: ColorFilter.mode(
                          iconColor,
                          BlendMode.srcIn,
                        ),
                      )
                      .marginOnly(left: !widget.iconOnly ? 12.0 : 0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get labelOnly => widget.icon != null;

  EdgeInsets get padding {
    if (widget.iconOnly) {
      return switch (widget.size) {
        ButtonSize.xl => const EdgeInsets.all(14),
        ButtonSize.lg => const EdgeInsets.all(10),
        ButtonSize.xs => const EdgeInsets.all(6),
      };
    }
    return switch (widget.size) {
      ButtonSize.xl => EdgeInsets.only(
          top: 14.0,
          bottom: 14.0,
          left: 28.0,
          right: labelOnly ? 28 : 20.0,
        ),
      ButtonSize.lg => EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 16.0,
          right: labelOnly ? 16 : 12.0,
        ),
      ButtonSize.xs => EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          left: 12.0,
          right: labelOnly ? 12 : 8.0,
        ),
    };
  }

  // Giống portfolio-design: border-radius: 12px
  BorderRadius get borderRadius {
    if (widget.type == ButtonType.tonal) {
      return BorderRadius.circular(14.0);
    }
    return switch (widget.size) {
      ButtonSize.xl => BorderRadius.circular(12.0),
      ButtonSize.lg => BorderRadius.circular(10.0),
      ButtonSize.xs => BorderRadius.circular(8.0),
    };
  }

  Color get backgroundColor {
    if (!widget.enabled) return context.color.brand.surface.disable;
    return switch (widget.type) {
      ButtonType.filled => _hovering ? context.color.neutral.surface.hover : context.color.neutral.surface.enable,
      ButtonType.outlined => Colors.transparent,
      ButtonType.tonal => _hovering ? context.color.neutral.surface.tertiary : context.color.neutral.surface.secondary,
    };
  }

  Border? get border {
    return switch (widget.type) {
      ButtonType.filled => null,
      ButtonType.outlined => Border.all(
          color: _hovering ? context.color.neutral.border.hover : Colors.transparent,
        ),
      ButtonType.tonal => null,
    };
  }

  Color get contentColor {
    if (!widget.enabled) return context.color.brand.icon.disable;

    return switch (widget.type) {
      ButtonType.filled => context.color.neutral.text.onButton,
      ButtonType.outlined => context.color.neutral.text.enable,
      ButtonType.tonal => _hovering ? context.color.neutral.icon.hover : context.color.neutral.icon.enable,
    };
  }

  Color get iconColor {
    if (!widget.enabled) return context.color.neutral.icon.disable;

    return switch (widget.type) {
      ButtonType.filled => context.color.neutral.icon.onButton,
      ButtonType.outlined => context.color.neutral.icon.primary,
      ButtonType.tonal => _hovering ? context.color.neutral.icon.hover : context.color.neutral.icon.enable,
    };
  }
}

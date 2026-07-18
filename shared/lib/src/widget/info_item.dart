import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resource/resource.dart';

import '../theme/brutal.dart';
import '../theme/design_mode.dart';

/// Data class cho Info Item
class InfoItemData {
  final SvgGenImage? icon;
  final String label;
  final String? link;
  final VoidCallback? onTap;

  const InfoItemData({
    this.icon,
    required this.label,
    this.link,
    this.onTap,
  });
}

class InfoItem extends StatefulWidget {
  final SvgGenImage? icon;
  final String label;
  final String? link;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? textColor;
  final Color? hoverColor;
  final double iconSize;
  final double fontSize;
  final double spacing;

  const InfoItem({
    super.key,
    this.icon,
    required this.label,
    this.link,
    this.onTap,
    this.iconColor,
    this.textColor,
    this.hoverColor,
    this.iconSize = 20,
    this.fontSize = 14,
    this.spacing = 12,
  });

  /// Factory constructor từ InfoItemData
  factory InfoItem.fromData(
    InfoItemData data, {
    Color? iconColor,
    Color? textColor,
    Color? hoverColor,
    double iconSize = 20,
    double fontSize = 14,
    double spacing = 12,
  }) {
    return InfoItem(
      icon: data.icon,
      label: data.label,
      link: data.link,
      onTap: data.onTap,
      iconColor: iconColor,
      textColor: textColor,
      hoverColor: hoverColor,
      iconSize: iconSize,
      fontSize: fontSize,
      spacing: spacing,
    );
  }

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  bool _isHovered = false;

  Future<void> _handleTap() async {
    // Ưu tiên onTap callback
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }

    // Mở link nếu có
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
    final defaultTextColor =
        context.isBrutal ? BrutalColors.inkSoft : Colors.white.withOpacity(0.8);
    final defaultHoverColor = context.isBrutal ? BrutalColors.orange : const Color(0xFF06B6D4);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: hasAction ? _handleTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              if (widget.icon != null)
                widget.icon!.svg(
                  width: widget.iconSize,
                  height: widget.iconSize,
                  colorFilter: ColorFilter.mode(
                    widget.hoverColor ?? defaultHoverColor,
                    BlendMode.srcIn,
                  ),
                ),

              SizedBox(width: widget.spacing),
              // Label
              Expanded(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: _isHovered ? (widget.hoverColor ?? defaultHoverColor) : (widget.textColor ?? defaultTextColor),
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                    decoration: _isHovered && hasAction ? TextDecoration.underline : TextDecoration.none,
                    decorationColor: widget.hoverColor ?? defaultHoverColor,
                  ),
                  child: Text(widget.label),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Info Item List - hiển thị danh sách các info items
class InfoItemList extends StatelessWidget {
  final List<InfoItemData> items;
  final Axis direction;
  final double spacing;
  final Color? iconColor;
  final Color? textColor;
  final Color? hoverColor;
  final double iconSize;
  final double fontSize;
  final double itemSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const InfoItemList({
    super.key,
    required this.items,
    this.direction = Axis.vertical,
    this.spacing = 16,
    this.iconColor,
    this.textColor,
    this.hoverColor,
    this.iconSize = 20,
    this.fontSize = 14,
    this.itemSpacing = 12,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final children = items.map((item) {
      return InfoItem.fromData(
        item,
        iconColor: iconColor,
        textColor: textColor,
        hoverColor: hoverColor,
        iconSize: iconSize,
        fontSize: fontSize,
        spacing: itemSpacing,
      );
    }).toList();

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _addSpacing(children, spacing, Axis.horizontal),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _addSpacing(children, spacing, Axis.vertical),
    );
  }

  List<Widget> _addSpacing(List<Widget> widgets, double space, Axis axis) {
    if (widgets.isEmpty) return widgets;

    final result = <Widget>[];
    for (int i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(axis == Axis.horizontal ? SizedBox(width: space) : SizedBox(height: space));
      }
    }
    return result;
  }
}

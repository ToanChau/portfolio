import 'package:flutter/material.dart';
import 'paginated_widget.dart';

class ListViewWithTopItems<T> extends StatelessWidget {
  final IndexedWidgetBuilder item;
  final IndexedWidgetBuilder topItemBuilder;
  final List<T>? items;
  final int topItemLength;
  final Widget? empty;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final bool reverse;
  final Axis scrollDirection;
  final PaginatedPlaceholderConfig? placeholderConfig;
  final ScrollPhysics? physics;

  const ListViewWithTopItems({
    super.key,
    required this.item,
    required this.topItemBuilder,
    this.items,
    this.topItemLength = 0,
    this.empty,
    this.padding,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.placeholderConfig,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    final bool showPlaceholder = placeholderConfig?.showPlaceholder ?? false;
    if (items != null && items!.isEmpty && topItemLength == 0) {
      return empty ?? const SizedBox.shrink();
    }
    if (items == null) {
      if (showPlaceholder) {
        return ListView.builder(
          physics: physics,
          reverse: reverse,
          shrinkWrap: shrinkWrap,
          padding: padding,
          scrollDirection: scrollDirection,
          itemCount: placeholderConfig!.placeholderCount,
          itemBuilder: placeholderConfig!.placeholder,
        );
      } else {
        return const SizedBox();
      }
    }
    return ListView.builder(
      reverse: reverse,
      padding: padding,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemCount: items!.length + topItemLength,
      itemBuilder: (context, index) {
        if (topItemLength > 0 || (index - topItemLength) < items!.length) {
          if (index < topItemLength) {
            return topItemBuilder(context, index);
          }
          return item(context, index - topItemLength);
        }
        if (index < items!.length) {
          return item(context, index);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
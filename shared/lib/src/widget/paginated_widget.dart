import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

const int _defaultPlaceholderCount = 3;

/// Abstract Paginated Widget
class PaginatedWidget<P1 extends Object> extends StatelessWidget {
  const PaginatedWidget._({super.key});

  factory PaginatedWidget.list({
    required AppPaginationHelper<P1, PaginationMeta> helper,
    required List<P1>? Function() items,
    required IndexedWidgetBuilder itemBuilder,
    bool shrinkWrap = false,
    PaginatedPlaceholderConfig? placeholderConfig,
    bool reverse = false,
    Axis scrollDirection = Axis.vertical,
    Widget? emptyWidget,
    EdgeInsets? padding,
    Alignment? loadMoreAlignment,
  }) =>
      ListPaginatedWidget<P1>(
        helper: helper,
        items: items,
        itemBuilder: itemBuilder,
        shrinkWrap: shrinkWrap,
        placeholderConfig: placeholderConfig,
        reverse: reverse,
        scrollDirection: scrollDirection,
        emptyWidget: emptyWidget,
        padding: padding,
        loadMoreAlignment: loadMoreAlignment,
      );

  factory PaginatedWidget.sliver({
    required List<P1>? items,
    required IndexedWidgetBuilder itemBuilder,
    required AppPaginationHelper<P1, PaginationMeta> helper,
    bool shrinkWrap = false,
    PaginatedPlaceholderConfig? placeholderConfig,
    bool reverse = false,
    Axis scrollDirection = Axis.vertical,
    Widget? emptyWidget,
    EdgeInsets? padding,
    Alignment? loadMoreAlignment,
  }) =>
      SliverPaginatedWidget(
        helper: helper,
        items: items,
        itemBuilder: itemBuilder,
        shrinkWrap: shrinkWrap,
        placeholderConfig: placeholderConfig,
        reverse: reverse,
        scrollDirection: scrollDirection,
        emptyWidget: emptyWidget,
        padding: padding,
        loadMoreAlignment: loadMoreAlignment,
      );

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

/// List-based pagination with loading indicator
class ListPaginatedWidget<P1 extends Object> extends PaginatedWidget<P1> {
  final bool useSliver;
  final AppPaginationHelper<P1, PaginationMeta> helper;
  final IndexedWidgetBuilder itemBuilder;
  final bool shrinkWrap;
  final PaginatedPlaceholderConfig? placeholderConfig;
  final bool reverse;
  final Axis scrollDirection;
  final Widget? emptyWidget;
  final List<P1>? Function() items;
  final EdgeInsets? padding;
  final Alignment? loadMoreAlignment;

  const ListPaginatedWidget({
    super.key,
    required this.helper,
    required this.items,
    required this.itemBuilder,
    this.useSliver = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.emptyWidget,
    this.shrinkWrap = false,
    this.placeholderConfig,
    this.padding,
    this.loadMoreAlignment,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    final bool showPlaceholder = placeholderConfig?.showPlaceholder ?? false;
    final allItems = items();
    final emptyContainer =
        useSliver ? const SliverToBoxAdapter() : const SizedBox.shrink();

    if (allItems != null && allItems.isEmpty) {
      return emptyWidget ?? emptyContainer;
    }

    return ValueListenableBuilder<bool>(
      valueListenable: helper.isLoading,
      builder: (context, isLoading, _) {
        final itemsList = allItems ?? [];
        final itemCount = itemsList.length + (isLoading ? 1 : 0);

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            helper.handleNotification(scrollInfo);
            return false;
          },
          child: allItems == null
              ? (showPlaceholder
                  ? ListView.builder(
                      reverse: reverse,
                      shrinkWrap: shrinkWrap,
                      padding: padding,
                      scrollDirection: scrollDirection,
                      itemCount: placeholderConfig!.placeholderCount,
                      itemBuilder: placeholderConfig!.placeholder,
                    )
                  : emptyContainer)
              : ListView.builder(
                  reverse: reverse,
                  shrinkWrap: shrinkWrap,
                  padding: padding,
                  scrollDirection: scrollDirection,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index < itemsList.length) {
                      return itemBuilder(context, index);
                    } else {
                      return LoadMoreWidget(alignment: loadMoreAlignment);
                    }
                  },
                ),
        );
      },
    );
  }
}

/// Sliver-based pagination (no loading widgets logic here)
class SliverPaginatedWidget<P1 extends Object> extends PaginatedWidget<P1> {
  final AppPaginationHelper<P1, PaginationMeta> helper;
  final IndexedWidgetBuilder itemBuilder;
  final bool shrinkWrap;
  final PaginatedPlaceholderConfig? placeholderConfig;
  final bool reverse;
  final Axis scrollDirection;
  final Widget? emptyWidget;
  final List<P1>? items;
  final EdgeInsets? padding;
  final Alignment? loadMoreAlignment;

  const SliverPaginatedWidget({
    super.key,
    required this.helper,
    required this.items,
    required this.itemBuilder,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.emptyWidget,
    this.shrinkWrap = false,
    this.placeholderConfig,
    this.padding,
    this.loadMoreAlignment,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    final showPlaceholder = placeholderConfig?.showPlaceholder ?? false;
    final itemList = items;
    const emptyContainer = SliverToBoxAdapter();

    if (itemList != null && itemList.isEmpty) {
      return emptyWidget ?? emptyContainer;
    }

    if (itemList == null) {
      if (showPlaceholder) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => placeholderConfig!.placeholder(context, index),
            childCount: placeholderConfig!.placeholderCount,
          ),
        );
      } else {
        return emptyContainer;
      }
    }

    return ValueListenableBuilder<bool>(
      valueListenable: helper.isLoading,
      builder: (context, isLoading, _) {
        final int itemCount = itemList.length + (isLoading ? 1 : 0);

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index < itemList.length) {
                return itemBuilder(context, index);
              } else {
                return LoadMoreWidget(alignment: loadMoreAlignment);
              }
            },
            childCount: itemCount,
          ),
        );
      },
    );
  }
}

class LoadMoreWidget extends StatelessWidget {
  final Alignment? alignment;

  const LoadMoreWidget({
    super.key,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}

/// Config for placeholder rendering
class PaginatedPlaceholderConfig {
  final int placeholderCount;
  final bool showPlaceholder;
  final IndexedWidgetBuilder placeholder;

  PaginatedPlaceholderConfig({
    this.placeholderCount = _defaultPlaceholderCount,
    required this.showPlaceholder,
    required this.placeholder,
  });
}

/// Generic helper for pagination
class AppPaginationHelper<P1 extends Object, P2 extends PaginationMeta> {
  final Future<PagedResult<P1>?> Function(P2, bool fetchFirst) fetcher;
  final P2 initialMeta;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  PaginationMeta? _paginationMeta;

  AppPaginationHelper({
    required this.fetcher,
    required this.initialMeta,
  });

  Future<void> fetch({bool fetchFirst = false}) async {
    if (!fetchFirst && !hasMore) return;
    if (isLoading.value) return;

    isLoading.value = true;
    try {
      if (fetchFirst) {
        final result = await fetcher(initialMeta, fetchFirst);
        _paginationMeta = result?.meta;
      } else {
        final P2? next = _paginationMeta?.next() as P2?;
        if (next != null) {
          final result = await fetcher(next, fetchFirst);
          _paginationMeta = result?.meta;
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  bool get hasMore => _paginationMeta?.last == false;

  void handleNotification(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
        hasMore &&
        !isLoading.value) {
      fetch();
    }
  }
}

import 'package:equatable/equatable.dart';


abstract class PaginationMeta {
  bool get last;

  PaginationMeta? next();

  static OffsetPaginationMeta initialOffset(int limit) {
    return OffsetPaginationMeta(start: 0, limit: limit);
  }

  static PagedPaginationMeta initialPaged(int limit) {
    return PagedPaginationMeta(page: 1, limit: limit);
  }

  static CursorPaginationMeta initialCursor(int limit) {
    return CursorPaginationMeta(limit: limit);
  }

  Map<String, dynamic> get queryParameters;
}

class OffsetPaginationMeta extends PaginationMeta {
  final int start;
  final int limit;
  final int? total;

  OffsetPaginationMeta({required this.start, required this.limit, this.total});

  @override
  bool get last => total == null ? true : start + limit >= total!;

  @override
  PaginationMeta? next() => last
      ? null
      : OffsetPaginationMeta(start: start + limit, limit: limit, total: total);

  @override
  Map<String, dynamic> get queryParameters => {
        'pagination[start]': start,
        'pagination[limit]': limit,
      };
}

class PagedPaginationMeta extends PaginationMeta {
  final int page;
  final int limit;
  final int? total;
  final int? pageCount;

  PagedPaginationMeta({
    required this.page,
    required this.limit,
    this.total,
    this.pageCount,
  });

  @override
  bool get last => total == null ? true : page * limit >= total!;

  @override
  PaginationMeta? next() => last
      ? null
      : PagedPaginationMeta(page: page + 1, limit: limit, total: total);

  @override
  Map<String, dynamic> get queryParameters => {
        'pagination[page]': page,
        'pagination[pageSize]': limit,
      };
}

class CursorPaginationMeta extends PaginationMeta {
  final String? cursor;
  final int limit;

  CursorPaginationMeta({this.cursor, required this.limit});

  @override
  bool get last => cursor == null;

  @override
  PaginationMeta? next() =>
      last ? null : CursorPaginationMeta(cursor: cursor, limit: limit);

  @override
  Map<String, dynamic> get queryParameters => {};
}

class PagedResult<T extends Object> extends Equatable {
  final List<T> data;
  final PaginationMeta meta;

  const PagedResult(this.data, this.meta);

  @override
  List<Object?> get props => [data, meta];
}

import 'package:collection/collection.dart';

import '../enum/enum.dart';

extension TypeSafeExt on Map<String, dynamic> {
  T? safeGet<T>(String key) {
    if (this[key] is T) {
      return this[key] as T;
    }
    return null;
  }

  DateTime? safeGetDateTime(String key) {
    final String? data = safeGet<String>(key);
    if (data != null) {
      return DateTime.parse(data);
    }
    return null;
  }

  List<T> safeGetList<T>(String key) {
    final List<dynamic>? data = safeGet<List<dynamic>>(key);
    if (data != null) {
      return data.map((e) => e as T).toList();
    }
    return [];
  }

  List<T>? safeGetModeList<T>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    final List<dynamic>? data = safeGet<List<dynamic>>(key);
    if (data != null) {
      return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    }
    return null;
  }

  T? safeGetEnum<T extends BaseEnum>(String key, List<T> values) {
    if (this[key] is String) {
      return values.firstWhereOrNull((element) => element.value == this[key]);
    }
    return null;
  }
}

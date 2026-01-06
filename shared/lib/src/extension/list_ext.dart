extension ListExtension<T> on List<T> {
  List<T> takes(int count) {
    return count > length ? this : sublist(0, count);
  }

  T? at(int index) {
    return index < length ? this[index] : null;
  }

  (bool, int) anyIndexed(bool Function(T element) test) {
    for (int index = 0; index < length; index++) {
      T element = this[index];
      if (test(element)) return (true, index);
    }
    return const (false, -1);
  }
}

extension ListNullableExtension<T> on List<T>? {
  T? firstWhereOrNull(bool Function(T) filter) {
    if (this == null) return null;
    for (final element in this!) {
      if (filter(element)) {
        return element;
      }
    }
    return null;
  }

  List<T> filterExcludeNulls() {
    return this?.where((element) => element != null).cast<T>().toList() ?? [];
  }

  bool isEmptyNonNull() {
    return this != null && this!.isEmpty;
  }
}

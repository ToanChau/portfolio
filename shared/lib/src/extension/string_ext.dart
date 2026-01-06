extension TextBuilderExtension on String {
  String shortenText({int limit = 23}) {
    return trim().length > limit
        ? '${trim().substring(0, limit - 3)}...'
        : this;
  }

  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeFirstOfEach() {
    return split(' ').map((e) => e.capitalize()).join(' ');
  }

  String add(String str) {
    return '$this$str';
  }
}

extension StringNullableExtension on String? {
  String getOrEmpty() {
    return this ?? '';
  }

  String nullThen(String defaultValue) {
    return this ?? defaultValue;
  }

  String nullOrEmptyThen(String defaultValue) {
    return isNullOrBlank ? defaultValue : this!;
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  bool get isNotNullOrBlank => !isNullOrBlank;

  int millisWithUtc() {
    return this == null
        ? 0
        : DateTime.parse('${this!}Z').toLocal().millisecondsSinceEpoch;
  }
}

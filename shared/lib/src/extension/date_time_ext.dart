import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  DateTime? addTimeZone() {
    if (this == null) return null;
    DateTime now = DateTime.now();
    int timezoneOffsetInHours = now.timeZoneOffset.inHours;
    return this!.add(Duration(hours: timezoneOffsetInHours));
  }

  String formatDate() {
    if (this == null) return '';
    final formatter = DateFormat('EEE d MMM');
    return formatter.format(this!);
  }
}

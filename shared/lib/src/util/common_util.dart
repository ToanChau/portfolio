import 'package:intl/intl.dart';

class CommonUtil {
  CommonUtil._();

  static bool showReferralDialog = false;

  static Map? referralData;

  static String getFormattedMonthDaySec(int sec, {int? timezoneOffset}) {
    return DateFormat('MMM d')
        .format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getDayInWeekSec(int sec, {int? timezoneOffset}) {
    return DateFormat('EEE')
        .format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getFormattedHourSec(int sec, {int? timezoneOffset}) {
    return DateFormat('HH:mm')
        .format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getFormattedDayHourSec(int sec, {int? timezoneOffset}) {
    return DateFormat('MMM d | HH:mm')
        .format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String fareinheitToCelcius(double fareinheit) {
    return ((fareinheit - 32) * 5 / 9).toStringAsFixed(1);
  }

  static String kelvinToCelcius(double kelvin, {int? fractionDigits}) {
    return (kelvin - 273.15).toStringAsFixed(fractionDigits ?? 1);
  }

  static int getDaysFromSec(int sec, {int? timezoneOffset}) {
    return ((sec + (timezoneOffset ?? 0)) / (60 * 60 * 24)).floor();
  }

  static DateTime getTimezoneAwareDtFromSec(int sec, {int? timezoneOffset}) {
    if (timezoneOffset == null) return getDtFromSec(sec);
    return DateTime.fromMillisecondsSinceEpoch(sec * 1000, isUtc: true)
        .add(Duration(seconds: timezoneOffset));
  }

  static DateTime getDtFromSec(int sec) {
    return DateTime.fromMillisecondsSinceEpoch(sec * 1000);
  }

  static String getDayTimeYear(int sec, {int? timezoneOffset}) {
    return DateFormat('MMM d, yyyy')
        .format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static RegExp dialCodeRegex = RegExp(r'^\+?[1-9]\d{0,3}');

  static RegExp phoneNumberRegex = RegExp(r'^[1-9]\d{7,14}$');

  static String formatCurrency(double amount) {
    //return 10m, 10k, 10b, 10t

    if (amount >= 1e12) {
      return '${(amount / 1e12).toStringAsFixed(1)}t';
    } else if (amount >= 1e9) {
      return '${(amount / 1e9).toStringAsFixed(1)}b';
    } else if (amount >= 1e6) {
      return '${(amount / 1e6).toStringAsFixed(1)}m';
    } else if (amount >= 1e3) {
      return '${(amount / 1e3).toStringAsFixed(1)}k';
    } else {
      return amount.toStringAsFixed(1);
    }
  }

  static String formatCurrencyDetail(double amount) {
    final formatter = NumberFormat.simpleCurrency(name: '');
    return formatter.format(amount);
  }
}

class DateAgoUtil {
  static String daysAgo(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

import 'package:flutter/material.dart';

class LogUtil {
  final String reset = '\x1B[0m';
  final String red = '\x1B[31m';
  final String green = '\x1B[32m';
  final String yellow = '\x1B[33m';
  final String blue = '\x1B[34m';
  final String magenta = '\x1B[35m';
  final String cyan = '\x1B[36m';

  void e(String message, {String? name, StackTrace? stackTrace}) {
    _log(
      message,
      color: red,
      name: name,
      stackTrace: stackTrace,
    );
  }

  void w(String message) {
    _log(
      message,
      color: yellow,
    );
  }

  void d(String message) {
    _log(
      message,
      color: blue,
    );
  }

  void _log(String message,
      {String color = '', String? name, StackTrace? stackTrace}) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
    debugPrint('$color$message$reset');
  }
}

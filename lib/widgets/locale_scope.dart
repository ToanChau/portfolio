import 'package:flutter/material.dart';

/// Scope giữ locale hiện tại của app, đổi runtime qua LangToggle.
class LocaleScope extends InheritedNotifier<ValueNotifier<Locale>> {
  const LocaleScope({super.key, required super.notifier, required super.child});

  static ValueNotifier<Locale> of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope not found above this context');
    return scope!.notifier!;
  }
}

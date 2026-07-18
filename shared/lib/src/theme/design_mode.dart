import 'package:flutter/material.dart';

/// Hai design system của portfolio: classic (dark + cyan glow)
/// và brutal (neo-brutalism: nền kem, viền mực, hard shadow).
enum DesignSystem { classic, brutal }

class DesignModeScope extends InheritedNotifier<ValueNotifier<DesignSystem>> {
  const DesignModeScope({super.key, required super.notifier, required super.child});

  static ValueNotifier<DesignSystem> of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DesignModeScope>();
    assert(scope != null, 'DesignModeScope not found above this context');
    return scope!.notifier!;
  }
}

extension DesignModeContextExt on BuildContext {
  /// true khi đang ở design system neo-brutalism.
  /// Mặc định brutal khi không có DesignModeScope (vd. widget test đơn lẻ).
  bool get isBrutal {
    final scope = dependOnInheritedWidgetOfExactType<DesignModeScope>();
    return (scope?.notifier?.value ?? DesignSystem.brutal) == DesignSystem.brutal;
  }
}

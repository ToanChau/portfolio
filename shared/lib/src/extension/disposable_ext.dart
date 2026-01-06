import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../helper/helper.dart';

extension TextEditingControllerDisposable on TextEditingController{
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(dispose);
  }
}

extension ValueNotifierDisposable<T> on ValueNotifier<T> {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(dispose);
  }
}

extension FocusNodeDisposable on FocusNode {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(dispose);
  }
}

extension AnimationControllerDisposable on AnimationController {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(dispose);
  }
}

extension BehaviorSubjectDisposable<T> on BehaviorSubject<T> {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(close);
  }
}

extension StreamSubscriptionDisposable<T> on StreamSubscription<T> {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(cancel);
  }
}

extension StreamControllerDisposable<T> on StreamController<T> {
  void disposedBy(DisposableBag disposable) {
    disposable.addCleanup(close);
  }
}

extension DisposableExtension on Disposable {
  void disposedBy(DisposableBag disposable) {
    disposable.addDisposable(this);
  }
}
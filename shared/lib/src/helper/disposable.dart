import 'package:flutter/material.dart';

abstract class Disposable {
  void dispose();
}

mixin DisposableMixin {
  final DisposableBag _disposableBag = DisposableBag();

  void addDisposable(Disposable disposable) {
    _disposableBag.addDisposable(disposable);
  }

  void addCleanup(void Function() cleanup) {
    _disposableBag.addCleanup(cleanup);
  }

  void disposeAll() {
    _disposableBag.disposeAll();
  }
}

mixin StateDisposableMixin<T extends StatefulWidget> on State<T> {
  DisposableBag get disposableBag => _disposableBag;

  final DisposableBag _disposableBag = DisposableBag();

  void addDisposable(Disposable disposable) {
    _disposableBag.addDisposable(disposable);
  }

  void addCleanup(void Function() cleanup) {
    _disposableBag.addCleanup(cleanup);
  }

  @override
  @mustCallSuper
  void dispose() {
    _disposableBag.disposeAll();
    super.dispose();
  }
}

class DisposableBag {
  final List<void Function()> _cleanupCallbacks = [];

  void addCleanup(void Function() cleanup) {
    _cleanupCallbacks.add(cleanup);
  }

  void addDisposable(Disposable disposable) {
    addCleanup(disposable.dispose);
  }

  void disposeAll() {
    for (final cleanup in _cleanupCallbacks) {
      cleanup();
    }
    _cleanupCallbacks.clear();
  }
}

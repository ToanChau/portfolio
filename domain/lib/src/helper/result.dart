import 'package:equatable/equatable.dart';

abstract class BaseResult<T extends Object> extends Equatable {
  final T? value;
  final Object? failure;

  const BaseResult({this.value, this.failure});

  ResultState get state {
    if (value != null) {
      return ResultState.success;
    } else if (failure != null) {
      return ResultState.failure;
    } else {
      return ResultState.none;
    }
  }
}

class Result<T extends Object> extends BaseResult<T> {
  const Result({super.value, super.failure});

  factory Result.success(T value) {
    return Result(value: value);
  }

  factory Result.failure(Object failure) {
    return Result(failure: failure);
  }

  @override
  List<Object?> get props => [value, failure];
}

enum ResultState {
  success,
  failure,
  none,
}

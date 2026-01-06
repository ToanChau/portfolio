import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

const String networkUnknownFailureMessage = 'failure_network_unknown';

const String serverUnknownFailureMessage = 'failure_server_unknown';
const String connectionFailureMessage = 'failure_connection';
const String sendTimeoutFailureMessage = 'failure_send_timeout';
const String connectionTimeoutFailureMessage = 'failure_connection_timeout';
const String receiveTimeoutFailureMessage = 'failure_receive_timeout';

const String badRequestFailureMessage = 'failure_bad_request';
const String unauthorizedFailureMessage = 'failure_unauthorized';
const String forbiddenFailureMessage = 'failure_forbidden';
const String notFoundFailureMessage = 'failure_not_found';
const String methodNotAllowedFailureMessage = 'failure_method_not_allowed';
const String notAcceptableFailureMessage = 'failure_not_acceptable';
const String internalServerFailureMessage = 'failure_internal_server';
const String httpUnknownFailureMessage = 'failure_http_unknown';

const String parserFailureMessage = 'failure_parser';
const String notLoginFailureMessage = 'failure_not_login';

const String cacheFailureMessage = 'failure_cache';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class EmptyFailure extends Failure {
  const EmptyFailure() : super('empty');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('timeout');
}

class HttpFailure extends Failure {
  final DioException exception;
  final Map? data;
  final ErrorRequest? error;

  const HttpFailure(super.message, this.exception, {this.data, this.error});
}

/// 1. NETWORK ERROR
class NetworkUnknownError extends Failure {
  final Object? cause;

  NetworkUnknownError(super.message, {this.cause});
}

class ConnectTimeoutFailure extends HttpFailure {
  const ConnectTimeoutFailure(DioException error)
      : super(connectionTimeoutFailureMessage, error);
}

class SendTimeoutFailure extends HttpFailure {
  const SendTimeoutFailure(DioException error)
      : super(sendTimeoutFailureMessage, error);
}

class ReceiveTimeoutFailure extends HttpFailure {
  const ReceiveTimeoutFailure(DioException error)
      : super(receiveTimeoutFailureMessage, error);
}

class ServerUnknownFailure extends HttpFailure {
  const ServerUnknownFailure(DioException error)
      : super(serverUnknownFailureMessage, error);
}

/// END OF SERVER ERROR

/// HTTP ERROR
class BadRequestFailure extends HttpFailure {
  const BadRequestFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(badRequestFailureMessage, exception, data: data, error: error);
}

class UnauthorizedFailure extends HttpFailure {
  const UnauthorizedFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(unauthorizedFailureMessage, exception, data: data, error: error);
}

class ForbiddenFailure extends HttpFailure {
  const ForbiddenFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(forbiddenFailureMessage, exception, data: data, error: error);
}

class NotFoundFailure extends HttpFailure {
  const NotFoundFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(notFoundFailureMessage, exception, data: data, error: error);
}

class MethodNotAllowedFailure extends HttpFailure {
  const MethodNotAllowedFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(methodNotAllowedFailureMessage, exception,
            data: data, error: error);
}

class NotAcceptableFailure extends HttpFailure {
  const NotAcceptableFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(notAcceptableFailureMessage, exception, data: data, error: error);
}

class InternalServerFailure extends HttpFailure {
  const InternalServerFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(internalServerFailureMessage, exception,
            data: data, error: error);
}

class HttpUnknownFailure extends HttpFailure {
  const HttpUnknownFailure(DioException exception,
      {Map? data, ErrorRequest? error})
      : super(httpUnknownFailureMessage, exception, data: data, error: error);
}

/// END OF HTTP ERROR

class ParserFailure extends Failure {
  final StackTrace? stackTrace;

  const ParserFailure({this.stackTrace, String? message})
      : super(message ?? parserFailureMessage);
}

class NotLoginFailure extends Failure {
  const NotLoginFailure() : super(notLoginFailureMessage);
}

class EmptyDataFailure extends Failure {
  const EmptyDataFailure() : super('data_is_empty');
}

class ClientNotFoundFailure extends Failure {
  const ClientNotFoundFailure() : super('user_not_found');
}

class ValidationFailure extends Failure {
  const ValidationFailure() : super('Title is required');
}

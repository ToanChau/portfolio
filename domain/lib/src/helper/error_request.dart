import 'package:domain/domain.dart';

class ErrorRequest {
  final int? status;
  final String? name;
  final String? message;
  final Map? details;

  ErrorRequest({
    this.status,
    this.name,
    this.message,
    this.details,
  });

  factory ErrorRequest.fromJson(Map<String, dynamic> json) {
    return ErrorRequest(
      status: json.safeGet<int>('status'),
      name: json.safeGet<String>('name'),
      message: json.safeGet<String>('message'),
      details: json.safeGet<Map>('details'),
    );
  }
}

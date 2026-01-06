import '../extension/extension.dart';

class OtpRequestModel {
  final String? message;
  final String? phone;

  OtpRequestModel({
    this.message,
    this.phone,
  });

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) {
    return OtpRequestModel(
      message: json.safeGet<String>('message'),
      phone: json.safeGet<String>('phone'),
    );
  }
}

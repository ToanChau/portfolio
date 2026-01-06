import '../extension/extension.dart';

class OtpVerificationModel {
  final String? sid;
  final String? serviceSid;
  final String? accountSid;
  final String? to;
  final String? channel;
  final String? status;
  final bool? valid;
  final String? amount;
  final String? payee;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;

  OtpVerificationModel({
    this.sid,
    this.serviceSid,
    this.accountSid,
    this.to,
    this.channel,
    this.status,
    this.valid,
    this.amount,
    this.payee,
    this.dateCreated,
    this.dateUpdated,
  });

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationModel(
      sid: json.safeGet<String>('sid'),
      serviceSid: json.safeGet<String>('serviceSid'),
      accountSid: json.safeGet<String>('accountSid'),
      to: json.safeGet<String>('to'),
      channel: json.safeGet<String>('channel'),
      status: json.safeGet<String>('status'),
      valid: json.safeGet<bool>('valid'),
      amount: json.safeGet<String>('amount'),
      payee: json.safeGet<String>('payee'),
      dateCreated: json.safeGetDateTime('dateCreated'),
      dateUpdated: json.safeGetDateTime('dateUpdated'),
    );
  }
}

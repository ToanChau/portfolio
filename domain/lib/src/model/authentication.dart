import '../extension/extension.dart';
import 'model.dart';

class AuthenticationModel {
  final String? jwt;
  final UserModel? user;
  final String? refreshToken;
  final String? expireTime;


  AuthenticationModel({
    this.jwt,
    this.user,
    this.refreshToken,
    this.expireTime
  });
  

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      jwt: json.safeGet<String>('jwt'),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      refreshToken: json.safeGet<String>('refresh_token'),
      expireTime: json.safeGet<String>('expired_time'),


    );
  }
}

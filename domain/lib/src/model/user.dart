import 'package:domain/domain.dart';

class UserModel {
  final int? id;
  final String? username;
  final String? displayName;
  final String? avatarUrl;
  final String? email;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MediaResourceModel? avatar;
  final List<int>? symbols;
  final String? referralCode;
  final int referralCount;
  final bool? kycRequested;
  final UserRoleModel? role;

  UserModel({
    this.referralCount = 0,
    this.id,
    this.username,
    this.displayName,
    this.avatarUrl,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.symbols,
    this.referralCode,
    this.kycRequested,
    this.role,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username ?? '',
        'displayName': displayName,
        'avatarUrl': avatarUrl,
        'email': email,
        'provider': provider,
        'confirmed': confirmed,
        'blocked': blocked,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'avatar': avatar?.toJson(),
        'fav_symbols': symbols,
        'referralCode': referralCode,
        'kycRequested': kycRequested,
        'role': role?.toJson(),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.safeGet<int>('id'),
      username: json.safeGet<String>('username'),
      displayName: json.safeGet<String>('displayName'),
      avatarUrl: json.safeGet<String>('avatar'),
      email: json.safeGet<String>('email'),
      provider: json.safeGet<String>('provider'),
      confirmed: json.safeGet<bool>('confirmed'),
      blocked: json.safeGet<bool>('blocked'),
      createdAt: json.safeGetDateTime('createdAt'),
      updatedAt: json.safeGetDateTime('updatedAt'),
      avatar: json['avatar'] != null
          ? MediaResourceModel.fromJson(json['avatar'])
          : null,
      symbols: json.safeGetList<int>('fav_symbols'),
      referralCode: json.safeGet<String>('referralCode'),
      referralCount: json.safeGet<int>('referralCount') ?? 0,
      kycRequested: json.safeGet<bool>('kycRequested'),
      role: json['role'] != null ? UserRoleModel.fromJson(json['role']) : null,
    );
  }
}

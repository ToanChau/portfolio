import 'package:domain/domain.dart';

class UserRoleModel {
  final int? id;
  final String? documentId;
  final UserRole? name;
  final String? description;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  UserRoleModel({
    this.id,
    this.documentId,
    this.name,
    this.description,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'documentId': documentId,
        'name': name?.value,
        'desciption': description,
        'type': type,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'publishedAt': publishedAt,
      };

  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return UserRoleModel(
      id: json.safeGet<int>('id'),
      documentId: json.safeGet<String>('documentId'),
      name: json.safeGetEnum<UserRole>('name', UserRole.values),
      description: json.safeGet<String>('description'),
      type: json.safeGet<String>('type'),
      createdAt: json.safeGetDateTime('createdAt'),
      updatedAt: json.safeGetDateTime('updatedAt'),
      publishedAt: json.safeGetDateTime('publishedAt'),
    );
  }
}

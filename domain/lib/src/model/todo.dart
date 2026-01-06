import 'package:domain/domain.dart';
import 'package:domain/src/extension/extension.dart';
import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String? id;
  final String? userId;
  final String? title;
  final String? description;
  final bool isComplete;

  TodoModel(
      {this.id,
      this.title,
      this.description,
      this.isComplete = false,
      this.userId});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json.safeGet<String>('id'),
      userId: json.safeGet<String>('useId'),
      title: json.safeGet<String>('title'),
      description: json.safeGet<String>('description'),
      isComplete: json.safeGet<bool>('isComplete') ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'useId': userId,
      'title': title,
      'description': description,
      'isComplete': isComplete,
    };
  }

  TodoModel copyWith(
      {String? id,
      String? userId,
      String? title,
      String? description,
      bool? isComplete}) {
    return TodoModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        isComplete: isComplete ?? this.isComplete);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
        title,
        description,
        isComplete,
      ];
}

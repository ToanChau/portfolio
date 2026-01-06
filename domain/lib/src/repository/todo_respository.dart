import 'package:domain/domain.dart';
import 'package:domain/src/model/todo.dart';

abstract class TodoRepository {
  Future<Result<TodoModel>> addTodo(TodoModel todo);
  Future<Result<void>> deleteTodo(String id);
  Future<Result<TodoModel>> getTodoById(String id);
  Future<Result<TodoModel>> updateTodo(TodoModel todo);
  Future<Result<List<TodoModel>>> getAllTodos();
}

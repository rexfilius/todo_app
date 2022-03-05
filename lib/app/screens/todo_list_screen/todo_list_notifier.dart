import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/todo_app_lib.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  var database = ref.watch(hiveDatabaseProvider);
  return TodoListNotifier(hiveDatabase: database);
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier({required this.hiveDatabase}) : super([]);

  HiveDatabase hiveDatabase;

  void insertTodo(Todo todo) {
    hiveDatabase.addTodo(todo);
    state = [...state, todo];
  }

  Todo? getTodo(Todo todo) {
    return hiveDatabase.getTodo(todo);
  }

  void removeTodo(Todo todo) {
    hiveDatabase.removeTodo(todo);
    state.remove(todo);
  }
}

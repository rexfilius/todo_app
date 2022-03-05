import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/todo_app_lib.dart';

const String todoBox = 'todo';

final hiveDatabaseProvider = Provider<HiveDatabase>((ref) => HiveDatabase());

class HiveDatabase {
  HiveDatabase() {
    _createBox();
  }

  void _createBox() async {
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>(todoBox);
  }

  Box<Todo> getTodoBox() {
    return Hive.box(todoBox);
  }

  addTodo(Todo todo) {
    todo.save();
  }

  removeTodo(Todo todo) {
    todo.delete();
  }

  Todo? getTodo(Todo todo) {
    final box = getTodoBox();
    return box.get(null, defaultValue: todo);
  }
}

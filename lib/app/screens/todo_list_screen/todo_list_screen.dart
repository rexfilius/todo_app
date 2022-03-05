import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/todo_app_lib.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiveDatabase = ref.watch(hiveDatabaseProvider);
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: hiveDatabase.getTodoBox().listenable(),
        builder: (context, box, widget) {
          return TodoList(todoList: todoList);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.todoDetailScreen,
            arguments: Todo('', ''),
          );
        },
      ),
    );
  }
}

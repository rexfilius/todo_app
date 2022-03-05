import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/todo_app_lib.dart';

class TodoDetailScreen extends ConsumerWidget {
  const TodoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30.0,
            icon: const Icon(Icons.done, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

import 'package:todo_app/todo_app_lib.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({required this.todoList, Key? key}) : super(key: key);

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return TodoItem(
          todo: todoList[index],
          onClick: () {
            Navigator.pushNamed(
              context,
              AppRoutes.todoDetailScreen,
              arguments: Todo(
                todoList[index].title,
                todoList[index].description,
              ),
            );
          },
        );
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.todo,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final Todo todo;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 12.0,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              todo.title,
              style: TodoAppTextStyle.headerText,
            ),
            Text(
              todo.description,
              style: TodoAppTextStyle.bodyText,
            ),
          ],
        ),
      ),
    );
  }
}

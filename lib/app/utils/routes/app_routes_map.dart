import 'package:todo_app/todo_app_lib.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.homeScreen: (context) => const HomeScreen(),
  AppRoutes.todoListScreen: (context) => const TodoListScreen(),
  AppRoutes.todoDetailScreen: (context) => const TodoDetailScreen(),
};

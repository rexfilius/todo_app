import 'package:hive_flutter/adapters.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  Todo(this.title, this.description);
}

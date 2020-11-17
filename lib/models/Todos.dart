import 'package:flutter/foundation.dart';

class Todos {
  final id;
  final userId;
  final title;
  final completed;

  Todos(
      {@required this.id,
      @required this.userId,
      @required this.title,
      @required this.completed});

  factory Todos.fromJson(Map<String, dynamic> products) {
    return Todos(
        id: products['id'],
        userId: products['userId'],
        title: products['title'],
        completed: products['completed']);
  }
}

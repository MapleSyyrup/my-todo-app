import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  Map<String, Todo> _todoList = {};

  Map<String, Todo> get todoList {
    return {..._todoList};
  }

  int get todoCount => _todoList.length;

  void addNewTodo(String newtodo, String newDate) {
    if (_todoList.containsKey(newDate)) {
      _todoList.update(newDate, (existing) => Todo(task: existing.task, date: existing.date));
    } else {
      _todoList.putIfAbsent(newDate, () => Todo(task: newtodo, date: DateTime.now().toString(),));
    }
    notifyListeners();
  }
}

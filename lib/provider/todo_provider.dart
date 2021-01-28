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
      _todoList.update(newDate, (existing) => Todo(todo: existing.todo, date: existing.date));
    } else {
      _todoList.putIfAbsent(newDate, () => Todo(todo: newtodo, date: DateTime.now()));
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  Map<String, Todo> _todoList = {};

  Map<String, Todo> get todoList {
    return {..._todoList};
  }

  int get todoCount => _todoList.length;

  void addNewTodo(String newtodo) {
    if (_todoList.containsKey(newtodo)) {
      _todoList.update(newtodo, (existingTodo) => Todo(todo: existingTodo.todo));
    } else {
      _todoList.putIfAbsent(newtodo, () => Todo(todo: newtodo));
    }
    notifyListeners();
  }
}

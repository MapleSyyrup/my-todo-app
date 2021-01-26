import 'package:flutter/material.dart';
// import '../widgets/add_todo.dart';
import '../models/todo.dart';
// import '../screens/todo_overview_screen.dart';

class TodoProvider with ChangeNotifier {
  Map<String, Todo> _todoList = {};

  Map<String, Todo> get todoList {
    return {..._todoList};
  }

  int get todoCount => _todoList.length;

  void addNewTodo(String todo) {
    if (_todoList.containsKey(todo)) {
      _todoList.update(todo, (existingTodo) => Todo(todo: existingTodo.todo));
    } else {
      _todoList.putIfAbsent(todo, () => Todo(todo: todo));
    }
    // _todoList.add(listTodo);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

import '../models/todo.dart';

/*Provider is used for the app state management
ChangeNotifier - provides change notification to its listeners

_todolist = for the collection of key/value pairs of task
todoList = getter of key/value pairs of task
todoCount = to count how many tasks are in the list
addNewTodo = function to add a task in the list based on the newDate
 if the date is in the list, it will update the existing task,
 else, a new task will be added*/

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
      _todoList.putIfAbsent(
          newDate,
          () {
            return Todo(
                task: newtodo,
                date: newDate,
              );
          });
    }
    notifyListeners();
  }
}

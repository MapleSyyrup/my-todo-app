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
  ///Map for _todolist
  Map<String, Todo> _todoList = {};

  /// getter of _todoList
  Map<String, Todo> get todoList {
    return {..._todoList};
  }

  ///count of the _todoList
  int get todoCount => _todoList.length;

  void addNewTodo(String newTodo, String newDate) {
    if (_todoList.containsKey(newDate)) {
      /// if the date is existing, the task will update
      _todoList.update(newDate, (existing) => Todo(task: newTodo, date: existing.date));
    } else {
      ///if the date is not present, a new todo will be added in the map
      _todoList.putIfAbsent(newDate, () {
        return Todo(
          task: newTodo,
          date: newDate,
        );
      });
    }
    notifyListeners();
  }

  ///Removes a task
  void removeItem(String todoDate) {
    _todoList.remove(todoDate);
    notifyListeners();
  }
}

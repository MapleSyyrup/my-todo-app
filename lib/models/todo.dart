import 'package:flutter/foundation.dart';

/*Handles the user inputs of tasks

required parameter task - holds the user input of task
required parameter date - shows the date when the task was added in the list*/

class Todo {
  final String task;
  final String date;

  Todo({
    @required this.task,
    @required this.date,
  });
}

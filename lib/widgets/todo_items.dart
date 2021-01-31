import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/todo.dart';
import '../models/custom_colors.dart';

/*TodoItems = shows the list of todos 
CheckboxListTile = creates a combination of checkbox and a list tile
The checked box is considered as a completed task*/

class TodoItems extends StatefulWidget {
  static const routeName = '/todo-items';
  final Todo todo;

  TodoItems({this.todo});

  @override
  _TodoItemsState createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 7,
      ),
      child: CheckboxListTile(
        value: _isCompleted,
        title: Text(
          widget.todo.task,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().add_jm().format(DateTime.parse(widget.todo.date)),
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool completedTask) => setState(() => _isCompleted = completedTask),
        tileColor: _isCompleted ? isCompletedTheme : isNotCompletedTheme,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/todo.dart';

/*TodoItems = shows the list of todos */

class TodoItems extends StatefulWidget {
  static const routeName = '/todo-items';
  final Todo todo;

  TodoItems({this.todo});

  @override
  _TodoItemsState createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(202, 240, 248, 1),
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 7,
      ),
      child: ListTile(
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
      ),
    );
  }
}

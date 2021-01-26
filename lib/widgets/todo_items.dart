import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../models/todo.dart';

class TodoItems extends StatefulWidget {
  static const routeName = '/todo-items';
  final Todo todo;

  const TodoItems({this.todo});

  @override
  _TodoItemsState createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 7,
      ),
      child: ListTile(
        title: Text(
          widget.todo.todo,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        // subtitle: Text(
        //   DateFormat.yMMMEd().format(widget.todo.date),
        // ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
import '../models/todo.dart';
import 'todo_items.dart';


class BuildDismissible extends StatelessWidget {
  const BuildDismissible({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.date),
      child: TodoItems(todo: todo),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the task?'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              )
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<TodoProvider>(context, listen: false).removeItem(todo.date);
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:my_todo_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../models/custom_colors.dart';
import 'add_todo.dart';

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
    final TodoProvider provider = Provider.of<TodoProvider>(context, listen: true);

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
        secondary: IconButton(
            icon: Icon(
              Icons.edit,
              color: primaryTheme,
            ),
            onPressed: () {
               return showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {},
                  child: AddTodo(
                    (String newTodo, String newDate) => provider.addNewTodo(newTodo, newDate),
                  ),
                  behavior: HitTestBehavior.opaque,
                );
              });
            }),

        // Provider.of<TodoProvider>(context).addNewTodo(newtodo, newDate),
      ),
    );
  }
}

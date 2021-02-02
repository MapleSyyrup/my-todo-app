import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
// import '../models/todo.dart';

/*Handles the Add Todo Screen
_todoController = holds the TextEditingController for todo
submitTodo = executes when the done button is pressed
 */

class AddTodo extends StatefulWidget {
  final Function(String, String) addTodo;

  const AddTodo(this.addTodo);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _todoController = TextEditingController();
  final _editedTodo = Todo(
    task: '',
    date: null,
  );

  void submitTodo() {
    // final enteredTodo = _todoController.text;
    // final date = existingDate != null ? existingDate : DateTime.now().toString();
    final todo = Todo(
      task: _todoController.text,
      date: _editedTodo.date ?? DateTime.now().toString(),
    );

    if (todo.task.isEmpty) {
      return;
    }
    // String newDate;
    // String newtodo;
    _editedTodo.date != null
        ? Provider.of<TodoProvider>(context, listen: false).addNewTodo(_editedTodo.task, _editedTodo.date)
        : Provider.of<TodoProvider>(context, listen: false).addNewTodo(todo.task, todo.date);

    widget.addTodo(todo.task, todo.date);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'What to do?'),
                controller: _todoController,
                autofocus: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.done,
                      color: Theme.of(context).accentColor,
                    ),
                    iconSize: 35,
                    onPressed: submitTodo,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

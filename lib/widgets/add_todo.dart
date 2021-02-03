import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

/*Handles the Add Todo Screen
_todoController = holds the TextEditingController for todo
submitTodo = executes when the done button is pressed
 */

class AddTodo extends StatefulWidget {
  final Function(String, String) addTodo;
  final String task;
  final String date;

  const AddTodo({this.addTodo, this.task, this.date});

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _todoController = TextEditingController();

  void submitTodo() {
    /// this function is called when saving the todo
    final todo = Todo(
      task: _todoController.text,
      date: widget.date ?? DateTime.now().toString(),
    );

    if (todo.task.isEmpty) {
      ///if task is empty, it will not be saved
      return;
    }

    widget.addTodo(todo.task, todo.date);

    ///addTodo throws the task and date

    Navigator.of(context).pop();

    ///this closes the modalBottomSheet when the todo is saved
  }

  @override
  void didChangeDependencies() {
    /// this is called when the task changes
    _todoController.text = widget.task;
    _todoController.selection = TextSelection.fromPosition(TextPosition(offset: _todoController.text.length));
    super.didChangeDependencies();
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

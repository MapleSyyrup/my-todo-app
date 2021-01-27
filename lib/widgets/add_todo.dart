import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final Function(String) addTodo;

  const AddTodo(this.addTodo);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _todoController = TextEditingController();

  void submitTodo() {
    final enteredTodo = _todoController.text;

    if (enteredTodo.isEmpty) {
      return;
    }

    widget.addTodo(enteredTodo);

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
                // onSubmitted: (_) => submitTodo(),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/constants.dart';
import '../provider/todo_provider.dart';
import '../widgets/add_todo.dart';
import '../widgets/dismissible.dart';

class TodoOverviewScreen extends StatefulWidget {
  static const routeName = '/todo-overview';

  @override
  _TodoOverviewScreenState createState() => _TodoOverviewScreenState();
}

class _TodoOverviewScreenState extends State<TodoOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoProvider provider = Provider.of<TodoProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Todo'),
      ),
      resizeToAvoidBottomInset: false,
      body: provider.todoList.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      'Create your first task today!',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        Constants.noTodoImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: provider.todoList.length,
              itemBuilder: (ctx, i) {
                final todo = provider.todoList.values.toList()[i];
                return BuildDismissible(todo: todo);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {},
                  child: AddTodo(
                    addTodo: (String newTodo, String newDate) => provider.addNewTodo(newTodo, newDate),
                  ),
                  behavior: HitTestBehavior.opaque,
                );
              });
        },
      ),
    );
  }
}

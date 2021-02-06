import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/todo_items.dart';
import '../models/constants.dart';
import '../provider/todo_provider.dart';
import '../widgets/add_todo.dart';

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

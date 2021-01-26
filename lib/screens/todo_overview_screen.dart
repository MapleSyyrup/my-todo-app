import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/todo_items.dart';

import '../provider/todo_provider.dart';
import '../models/todo.dart';
import '../widgets/add_todo.dart';

class TodoOverviewScreen extends StatefulWidget {
  static const routeName = '/todo-overview';

  @override
  _TodoOverviewScreenState createState() => _TodoOverviewScreenState();
}

class _TodoOverviewScreenState extends State<TodoOverviewScreen> {
  // List<Todo> todoList = [];
  Map<String, Todo> _todoList = {};

  Map<String, Todo> get todoList {
    return {..._todoList};
  }

  int get todoCount => _todoList.length;

  final _todoController = TextEditingController();

  // void startAddNewTodo(BuildContext context) {
  //   // Todo listTodo;
  //   // final providerAddTodo = Provider.of<TodoProvider>(context, listen: false).addNewTodo(listTodo);

  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
  //     context: context,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: AddTodo() ,
  //         // ((add) {
  //         //   // final todo = Todo(todo: a, date: DateTime.now());
  //         //   // Provider.of<TodoProvider>(context, listen: false).addNewTodo();
  //         //   final addTodo = Todo(todo: add);
  //         //   Provider.of<TodoProvider>(context, listen: false).addNewTodo();
  //         // }),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
  // }

  // void addNewTodo(String newTodo) {
  //   final newTodoList = Todo(todo: newTodo);

  //   setState(() {
  //     todoList.add(newTodoList);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Todo'),
      ),
      // drawer: AppDrawer(),
      resizeToAvoidBottomInset: false, //this is needed so the image.asset will not move when the keyboard is in use
      body: todoList.isEmpty
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
                        'assets/images/notodo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (ctx, i) {
                final todo = Provider.of<TodoProvider>(context).todoList.values.toList()[i];
                return TodoItems(
                  todo: todo,
                );
              },
              // children: [
              //   ...todoList.map((lists) => TodoItems(todo: lists)).toList(),
              // ],
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
                  child: AddTodo((String newTodo) {
                    Provider.of<TodoProvider>(context).addNewTodo(_todoController.text);
                  }),
                  // (_todoController.text)
                  //  {Provider.of<TodoProvider>(context).addNewTodo(_todoController.text);},
                  behavior: HitTestBehavior.opaque,
                );
              });
        },
        // startAddNewTodo,
      ),
    );
  }
}

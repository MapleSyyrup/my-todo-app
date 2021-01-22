import 'package:flutter/material.dart';

class TodoOverviewScreen extends StatefulWidget {
 static const routeName = '/Todo-Overview';

  @override
  _TodoOverviewScreenState createState() => _TodoOverviewScreenState();
}

class _TodoOverviewScreenState extends State<TodoOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo'),
      ),
      // drawer: AppDrawer(),
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/todo_overview_screen.dart';
import '../widgets/todo_items.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/todo-overview':
        return MaterialPageRoute(builder: (BuildContext context) => TodoOverviewScreen());
      case '/todo-items':
      // final todoArgs = setting.arguments as String;
      return MaterialPageRoute(builder: (BuildContext context) => TodoItems());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => TodoOverviewScreen());
    }
  }
}

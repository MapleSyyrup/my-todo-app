import 'package:flutter/material.dart';

import '../screens/todo_overview_screen.dart';
import '../widgets/todo_items.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TodoOverviewScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) => TodoOverviewScreen());
      case TodoItems.routeName:
      // final todoArgs = setting.arguments as String;
      return MaterialPageRoute(builder: (BuildContext context) => TodoItems());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => TodoOverviewScreen());
    }
  }
}

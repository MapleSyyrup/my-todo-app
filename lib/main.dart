import 'package:flutter/material.dart';

import './models/custom_colors.dart';
import './screens/todo_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo',
      theme: ThemeData(
        primarySwatch: primaryTheme,
        accentColor: accentTheme,
        canvasColor: canvasTheme,
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontSize: 20))),
      ),
      initialRoute: TodoOverviewScreen.routeName,
      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute<dynamic>(builder: (BuildContext context) => TodoOverviewScreen()),
    );
  }
}

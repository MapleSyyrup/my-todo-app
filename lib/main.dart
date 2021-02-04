import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/custom_colors.dart';
import './screens/todo_overview_screen.dart';
import './models/router.dart';
import './provider/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TodoProvider()),

        ///Creates a ChangeNotifier for TodoProvider
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: primaryTheme,
          accentColor: accentTheme,
          fontFamily: 'Quicksand-Regular',
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontSize: 20))),
        ),
        initialRoute: TodoOverviewScreen.routeName,

        ///First route to show
        onGenerateRoute: Routers.generateRoute,

        ///When the app is navigated to a named route, this callback is used
      ),
    );
  }
}

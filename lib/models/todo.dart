import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  final String todo;
  final DateTime date;

  Todo({
    @required this.todo,
    this.date,
  });

}

import 'package:flutter/material.dart';
import 'package:mobile_project/todoList.dart';

void main() => runApp(Myproject());

class Myproject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: TodoList(),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:mobile_project/showTodo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //get value from text filed
  TextEditingController controller = new TextEditingController();
  //array to store todos list
  List<Todo> todos = [];
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }
  //check box and condition isChecked
  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }
  /* add todo to array todos list
  *  Cancle button and Add button
  */
  _addTodo() {
    showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Todo'),
            content: TextField(
              controller: controller,
              autofocus: true,
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Calcle'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                 setState(() {
                   final todo = new Todo(title: controller.value.text);
                   if(controller.value.text == ""){
                     print("");
                   }else{
                      todos.add(todo);  
                   }
                  controller.clear();
                  Navigator.of(context).pop(todo);
                 });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      //float button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}

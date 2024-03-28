import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/util/todo_list.dart';
import 'package:todo/util/New_Task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [
    Todo(todoName: "Do Exercise", completed: false),
  ];

  TextEditingController _todoNameController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index].completed = !todoList[index].completed;
    });
  }

  void saveNewTask() {
    List<Todo> newTodoList = [
      ...todoList,
      Todo(completed: false, todoName: _todoNameController.text)
    ];
    setState(() {
      debugPrint("original name ${_todoNameController.text}");
      todoList = newTodoList;
      debugPrint("changed name ${_todoNameController.text}");
      _todoNameController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return New_Task(
          controller: _todoNameController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 181, 226),
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TODO_LIST(
              taskName: todoList[index].todoName,
              taskCompleted: todoList[index].completed,
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}

import'package:flutter/material.dart';
import 'package:todo/util/todo_list.dart';
import 'package:todo/util/New_Task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/data.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
    }

    final _controller = TextEditingController();

  void checkBoxChanged(bool ? value, int index){
    setState(() {
      db.tODO_LIST[index][1] = !db.tODO_LIST[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.tODO_LIST.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return New_Task(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.tODO_LIST.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
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
          itemCount: db.tODO_LIST.length,
        itemBuilder: (context, index){
            return TODO_LIST(
                taskName: db.tODO_LIST[index][0],
                taskCompleted: db.tODO_LIST[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
            );
        }
      ),
    );
  }
}

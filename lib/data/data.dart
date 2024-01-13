import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List tODO_LIST = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    tODO_LIST = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    tODO_LIST = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", tODO_LIST);
  }
}
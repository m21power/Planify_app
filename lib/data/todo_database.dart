import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todos = [];
  final _myBox = Hive.box('myBox');
  // if the app is opened for the first time, then add some default tasks
  void InitialState() {
    todos = [
      ['Coding', false],
      ['Exercise', false],
    ];
  }

  // loading data
  void loadData() {
    todos = _myBox.get('TODOLIST', defaultValue: todos);
  }

  // update data
  void updateData() {
    _myBox.put('TODOLIST', todos);
  }
}

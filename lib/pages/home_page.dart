import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/data/todo_database.dart';
import 'package:practice_app/pages/drawer_page.dart';
import 'package:practice_app/settings/themes/dark_theme.dart';
import 'package:practice_app/settings/themes/light_theme.dart';
import 'package:practice_app/utils/dialog_box.dart';
import 'package:practice_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  TodoDatabase db = TodoDatabase();
  final myBox = Hive.box('myBox');
  // IF the app is opened for the first time, then add some default tasks
  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
      db.InitialState();
    } else {
      db.loadData();
    }
  }

  // checked if it is completed
  void checkBoxClicked(int index, bool? value) {
    setState(() {
      db.todos[index][1] = value;
      db.updateData();
    });
  }

  // save task to the list
  void saveTask() {
    setState(() {
      db.todos.insert(0, [controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
      db.updateData();
    });
  }

  // for showing dialog box
  void showDialogBox() {
    showDialog(
        context: context,
        builder: (context) =>
            DialogBox(controller: controller, onSave: saveTask));
  }

  // method for deleting task from the list
  void deleteTaskFunction(int index) {
    setState(() {
      db.todos.removeAt(index);
      db.updateData();
    });
  }

  // changing theme
  void changeTheme(bool value) {
    setState(() {
      myBox.put('isDark', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.themeData, // Apply light theme
      darkTheme: DarkTheme.themeData, // Apply dark theme
      themeMode: myBox.get('isDark') == null
          ? ThemeMode.system
          : myBox.get('isDark')
              ? ThemeMode.dark
              : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerPage(
          isDarkMode: myBox.get('isDark') == null ? false : myBox.get('isDark'),
          onChanged: (value) => changeTheme(value),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'My Planner',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: db.todos.length,
          itemBuilder: (context, index) => TodoTile(
            taskName: db.todos[index][0],
            isCompleted: db.todos[index][1],
            onChanged: (value) => checkBoxClicked(index, value),
            deleteTask: (context) => deleteTaskFunction(index),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: showDialogBox, child: Icon(Icons.add)),
      ),
    );
  }
}

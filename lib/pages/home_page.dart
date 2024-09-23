import 'package:Plannify/data/todo_database.dart';
import 'package:Plannify/pages/about_page.dart';
import 'package:Plannify/pages/consistency_page.dart';
import 'package:Plannify/pages/drawer_page.dart';
import 'package:Plannify/pages/main_screen_page.dart';
import 'package:Plannify/settings/themes/dark_theme.dart';
import 'package:Plannify/settings/themes/light_theme.dart';
import 'package:Plannify/utils/dialog_box.dart';
import 'package:Plannify/utils/todo_tile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  // ignore: must_call_super
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

  //pages of the app

  List _pages = [AboutPage(), HomePage(), ConsistencyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBox.get('isDark') == null
          ? Colors.white
          : myBox.get('isDark')
              ? Colors.black
              : Colors.white,
      drawer: DrawerPage(
        isDarkMode: myBox.get('isDark') == null ? false : myBox.get('isDark'),
        onChanged: (value) => changeTheme(value),
      ),
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: showDialogBox,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            style: ButtonStyle(
                iconSize: WidgetStatePropertyAll(30),
                shape: WidgetStateProperty.all(CircleBorder()),
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(Colors.teal)),
          )
        ],
        backgroundColor: Colors.teal,
        title: Text(
          'Daily Plan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
    );
  }
}

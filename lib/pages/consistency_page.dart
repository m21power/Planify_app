import 'package:Plannify/pages/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConsistencyPage extends StatefulWidget {
  const ConsistencyPage({super.key});

  @override
  State<ConsistencyPage> createState() => _ConsistencyPageState();
}

class _ConsistencyPageState extends State<ConsistencyPage> {
  final myBox = Hive.box('myBox');
  // changing theme
  void changeTheme(bool value) {
    setState(() {
      myBox.put('isDark', value);
    });
  }

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
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Consistency',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Coming soon...',
          style: TextStyle(
            color: myBox.get('isDark') == null
                ? Colors.black
                : myBox.get('isDark')
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConsistencyPage extends StatefulWidget {
  const ConsistencyPage({super.key});

  @override
  State<ConsistencyPage> createState() => _ConsistencyPageState();
}

class _ConsistencyPageState extends State<ConsistencyPage> {
  final myBox = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBox.get('isDark') == null
          ? Colors.white
          : myBox.get('isDark')
              ? Colors.black
              : Colors.white,
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
        child: Text('Coming soon...'),
      ),
    );
  }
}

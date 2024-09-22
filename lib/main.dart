import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/pages/home_page.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('myBox');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

import 'package:Plannify/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('myBox');
  runApp(HomePage());
}

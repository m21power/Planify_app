import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/pages/home_page.dart';
import 'package:practice_app/settings/themes/dark_theme.dart';
import 'package:practice_app/settings/themes/light_theme.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('myBox');
  runApp(
    MaterialApp(
      theme: LightTheme.themeData, // Apply light theme
      darkTheme: DarkTheme.themeData, // Apply dark theme
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

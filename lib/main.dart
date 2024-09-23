import 'package:Plannify/pages/consistency_page.dart';
import 'package:Plannify/pages/home_page.dart';
import 'package:Plannify/pages/main_screen_page.dart';
import 'package:Plannify/settings/themes/dark_theme.dart';
import 'package:Plannify/settings/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('myBox');
  final myBox = Hive.box('myBox');
  runApp(MaterialApp(
    theme: LightTheme.themeData, // Apply light theme
    darkTheme: DarkTheme.themeData, // Apply dark theme
    themeMode: myBox.get('isDark') == null
        ? ThemeMode.system
        : myBox.get('isDark')
            ? ThemeMode.dark
            : ThemeMode.light,
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

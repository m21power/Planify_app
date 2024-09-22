import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/settings/themes/dark_theme.dart';
import 'package:practice_app/settings/themes/light_theme.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final myBox = Hive.box('myBox');
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
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: Colors.teal,
          title: Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made by M.L',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 300,
                child: Text(
                  'Thank you for using our app! ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  //width: 300,
                  child: Text(
                    'Join our community on Telegram to stay updated, share your feedback, and connect with other',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.telegram,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'https://t.me/MesaysAppVault',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

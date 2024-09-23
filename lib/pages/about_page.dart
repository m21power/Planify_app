import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
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
        title: Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child:
                      Image.asset(height: 100, width: 100, 'assets/task.png')),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Text(
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    '                 Welcome to Planify!\n Your personal daily planner designed to help you stay organized and on track!\n',
                  ),
                ),
              ),
              Container(
                child: Text(
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    'Features:\n  • Track your tasks and goals effortlessly.\n  •  Monitor your daily consistency to build better habits.  \n  •  User-friendly interface that makes planning a breeze.\n '),
              ),
              Container(
                child: Text(
                  'Made by M•L \n   I believe that everyone can achieve their dreams with the right tools and mindset. Planify is here to empower you on your journey!\n \n ',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                //width: 300,
                child: Text(
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                  'Join our community on Telegram for updates, tips, and support:\n  ',
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.telegram,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'https://t.me/MesaysApp',
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

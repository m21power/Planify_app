import 'package:Plannify/pages/about_page.dart';
import 'package:Plannify/pages/consistency_page.dart';
import 'package:Plannify/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void changeBackground() {
    setState(() {});
  }

  List _pages = [AboutPage(), HomePage(), ConsistencyPage()];
  int _currentIndex = 1;
  final myBox = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: myBox.get('isDark') == null
            ? Colors.white
            : myBox.get('isDark')
                ? Colors.black
                : Colors.white,
        color: Colors.teal,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        items: [
          Icon(
            size: 30,
            Icons.info,
            color: Colors.white,
          ),
          Icon(
            size: 30,
            Icons.assignment,
            color: Colors.white,
          ),
          Icon(
            size: 30,
            Icons.flash_on,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}

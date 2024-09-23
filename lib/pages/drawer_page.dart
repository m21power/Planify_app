import 'package:Plannify/pages/about_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final Function(bool)? onChanged;
  final isDarkMode;
  DrawerPage({super.key, required this.onChanged, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: isDarkMode,
                  activeTrackColor: Colors.green,
                  onChanged: onChanged,
                  thumbColor: WidgetStateProperty.all(Colors.white),
                ),
              ),
              Text(
                'D A R K   M O D E',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.info,
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );
                },
                child: Text(
                  'A B O U T',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_app/pages/about_page.dart';

class DrawerPage extends StatelessWidget {
  Function(bool)? onChanged;
  final isDarkMode;
  DrawerPage({super.key, required this.onChanged, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {},
            leading: Switch(
              value: isDarkMode,
              activeTrackColor: Colors.green,
              onChanged: onChanged,
              thumbColor: WidgetStateProperty.all(Colors.white),
            ),
            title: Text('D A R K   M O D E'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
            leading: Icon(
              Icons.info,
              color: Colors.blue,
            ),
            title: Text('A B O U T'),
          ),
        ],
      ),
    );
  }
}

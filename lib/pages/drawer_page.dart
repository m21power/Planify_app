import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final Function(bool)? onChanged;
  final isDarkMode;
  DrawerPage({super.key, required this.onChanged, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Enter task...', border: OutlineInputBorder()),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  child: Text('Save'),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

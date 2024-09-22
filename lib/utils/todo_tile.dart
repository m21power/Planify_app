import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final taskName;
  final isCompleted;
  final Function(BuildContext)? deleteTask;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(8),
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[200], borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

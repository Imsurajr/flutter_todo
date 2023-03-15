import 'package:flutter/material.dart';

class TasksListTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkBoxClicked;
  final void Function()? longPressDetected;
  TasksListTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkBoxClicked,
      required this.longPressDetected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressDetected,
      leading: Text(
        taskTitle,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        // value: checkboxState,
        value: isChecked,
        onChanged: checkBoxClicked,
      ),
    );
  }
}

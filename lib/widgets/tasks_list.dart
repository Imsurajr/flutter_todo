import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task_data.dart';
import 'tasks_list_file.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final currentTask = taskData.tasks[index];
            return TasksListTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkBoxClicked: (checkBoxState) {
                taskData.updateTask(currentTask);
              },
              longPressDetected: () {
                taskData.deleteTask(currentTask);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

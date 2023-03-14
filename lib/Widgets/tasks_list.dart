import 'package:flutter/material.dart';
import '../models/tasks.dart';
import 'tasks_list_file.dart';

// this was stateless pehle

class TasksList extends StatefulWidget {

  final List<Tasks> tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    // context => the information of where that particular
    // object lives in the widget tree
    // gets stored in the builder or in that build context property
    // listview builder dynamic that to accha hai bde ya jyda tasks mai bh kaam krega
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return TasksListTile(
          // taskTitle: tasks[index].name,
          // isChecked: tasks[index].isDone,
          // checkBoxClicked: (checkBoxState) {
          //   setState(() {
          //     tasks[index].toggleDone();
          //   });
          // },
          //widget refers to the stateful widget
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxClicked: (checkBoxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
    //   ListView(
    //   children: [
    //     TasksListTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
    //     TasksListTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
    //     TasksListTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
    //   ],
    // );
  }
}

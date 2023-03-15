import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task_data.dart';
import 'tasks_list_file.dart';
import 'package:provider/provider.dart';

//class TasksList extends StatefulWidget {
//
//   @override
//   State<TasksList> createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
//
// }
class TasksList extends StatelessWidget {
  // since we dont need that widget . property kyuki hum ab tasklist jo task screen
  // mai call hua hai usse kuch le nhi rhe hai
// we don't need this as sateful isko isliye stateless bna diuya bcz ab info jo chaiye th vo provider de rhahai
  @override
  Widget build(BuildContext context) {
    // context => the information of where that particular
    // object lives in the widget tree
    // gets stored in the builder or in that build context property
    // listview builder dynamic that to accha hai bde ya jyda tasks mai bh kaam krega
    return Consumer<TaskData>(builder: (context, taskData, child) {
      //okay so pehle tumko Provider.of<TaskData>(context).tasks itna pura baar baar likhna pdh rha tha to isko sol h ese format
      //m consumer daldo and then taskData jonaam de rhe ho which you have to define yhi pr us naam se call krdo
      // we placed it here bcz item count m bh isko use krna hai and vo yha listview builder k undr arha tha t uske upr consu er
      // define kra sau tasklisttile pr use hota to whi define krte uske upr
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final currentTask = taskData.tasks[index];
          return TasksListTile(
            // taskTitle: tasks[index].name,
            // isChecked: tasks[index].isDone,
            // checkBoxClicked: (checkBoxState) {
            //   setState(() {
            //     tasks[index].toggleDone();
            //   });
            // },
            //widget refers to the stateful widget
            //   taskTitle: widget.tasks[index].name, baki sare bh ese hi the then provider mai chng hogye
            // taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            //ese sare bh consumer ki vjh se chng hogye
            taskTitle: currentTask.name,
            isChecked: currentTask.isDone,
            checkBoxClicked: (checkBoxState) {
              taskData.updateTask(currentTask);
              //now as ye stless widegt bn gya hai hm taskdata mai ek nya method bnakr usko call krkr checkbox ko update krege
              // setState(() {
              //   Provider.of<TaskData>(context).tasks[index].toggleDone();
              // });
            },
            longPressDetected: () {
              taskData.deleteTask(currentTask);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });

    //   ListView(
    //   children: [
    //     TasksListTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
    //     TasksListTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
    //     TasksListTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
    //   ],
    // );
  }
}

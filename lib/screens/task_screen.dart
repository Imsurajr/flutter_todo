import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/tasks_list.dart';
import '../models/task_data.dart';
import '../models/tasks.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  // reason in task list class
//   @override
//   State<TasksScreen> createState() => _TasksScreenState();
// }
//
// class _TasksScreenState extends State<TasksScreen> {
//   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen((newTask) {
                    // tasks.add(Tasks(name: newTask),);
                    Provider.of<TaskData>(context).tasks.add(
                          Tasks(name: newTask),
                        );
                    Navigator.pop(context);
                  },),
                ),
              ),
            );
          },),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: MediaQuery.of(context).devicePixelRatio * 9,
                  ),
                  radius: MediaQuery.of(context).devicePixelRatio * 9,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Todo List',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).devicePixelRatio * 12),
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} tasks",
                  style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 5.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TasksList(tasks),
                //   ListView.builder(
                //   itemCount: items.length,
                //   itemBuilder: (context, int index) {
                //     return items[index];
                //   },
                // ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),),
              ),),
        ],
      ),
    );
  }
}

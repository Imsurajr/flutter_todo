import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskScreen extends StatelessWidget {
  late Function addTaskCallback;
  static late String newTaskTitle;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Add New Task',
              style: GoogleFonts.openSans(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask) {
                newTaskTitle = newTask;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: () => addTaskCallback(newTaskTitle),
              // is function ke undr newTaskTile mtlb newTask dalkr hm usko vha pass kr rhe hai
              // is class k constructor ke through task screen mai
              child: Text(
                "ADD",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

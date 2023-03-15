import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  //we don't need this anymore hm directly us list m add kr dege isko jo models k undr bnai hai via provider
  // late Function addTaskCallback;
  // AddTaskScreen(this.addTaskCallback);
  // onpressed wagerah pr listen false krna
  static late String newTaskTitle;
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
               onPressed: () {
                Provider.of<TaskData>(context , listen: false).addTask(newTaskTitle);
                //isme simply .task.add nhi krna hai usme android studio koi error nhi dega but tumhara notifylistner krna jruri hai
                // vo kaam nhi krega kyuki vo ho na ho koi frk nhi pdega yha se add krne k try krega to + bn avo add hoga na hi
                // nums count hoge sari dikkat hogi bs
                Navigator.pop(context);
              },
              // we dont need this method reason sbse upr hai
                  // addTaskCallback(newTaskTitle),
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

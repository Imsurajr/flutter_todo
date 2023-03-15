import 'package:flutter/material.dart';

class TasksListTile extends StatelessWidget {
  final bool isChecked ;
  final String taskTitle;
  // pehle mene bs final Function bnakr niche checkBoxClicked() ye lga diya tha to
  // error arha tha
  final void Function(bool?) checkBoxClicked;

  TasksListTile({required this.taskTitle , required this.isChecked , required this.checkBoxClicked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskTitle,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing:  Checkbox(
        activeColor: Colors.lightBlueAccent,
        // value: checkboxState,
        value: isChecked,
        onChanged: checkBoxClicked,
      ),

      // TaskCheckBox( checkboxState: isChecked , toggleCheckboxState : (bool? newValue) { setState(() {isChecked = newValue!;}); } ),
      // we used TaskCheckBox because it was stateless widget and yha pr jha ye tha vo stateful tha but ab dono stateless hai to koi sense nhi bnta do alg alg stateless widget rkhne ka
      // and kyuki dono checkbox aur listile will be rebuilt everytime we will be click or check uncheck the checkbx
    );
  }
}

// (bool? newValue) {
// setState(() {
// isChecked = newValue!;
// });
// }


//
// class TaskCheckBox extends StatelessWidget {
//
//    final bool? checkboxState ;
//    final void Function(bool?) toggleCheckboxState;
//    TaskCheckBox({this.checkboxState, required this.toggleCheckboxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

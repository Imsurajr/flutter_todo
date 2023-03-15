import 'package:flutter/foundation.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> tasks = [
    Tasks(name: 'Buy milk'),
    Tasks(name: 'Finish Homework'),
    Tasks(name: 'Eat Healthy'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
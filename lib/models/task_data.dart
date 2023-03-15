import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(name: 'Buy milk'),
    Tasks(name: 'Finish Homework'),
    Tasks(name: 'Eat Healthy'),
  ];

  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Tasks(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

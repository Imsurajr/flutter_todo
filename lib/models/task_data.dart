import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(name: 'Buy milk'),
    Tasks(name: 'Finish Homework'),
    Tasks(name: 'Eat Healthy'),
  ];

  //using this unmodifiable list view will make sure ki hm glte se _tasks wali mai add na krde vese private mai add nhi hoga
  // but vo code mai or bh khi jgh tasks ki list ki jrurat pd rhi hai hme to vha hme list ka substitute ek getter
  // bhjna hi tha to usko better hai unmodifiable bhjo jisse ye jo lisner wali dikkata hai ki vo add krna reh jaye vo khtm hojaye
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

  void updateTask(Tasks task)
  {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks task)
  {
    _tasks.remove(task);
    notifyListeners();
  }
}



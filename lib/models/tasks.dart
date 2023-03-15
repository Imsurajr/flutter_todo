class Tasks {
  String name;
  bool isDone = false;

  Tasks({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

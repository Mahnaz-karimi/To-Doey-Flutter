class Task {
  final String name;
  bool isDone;
  // som default isDone/object er lig med false
  Task({required this.name, this.isDone = false});
  // en method som ændrer boolean. true -> false og omvent
  void toggleDone() {
    isDone = !isDone;
  }
}

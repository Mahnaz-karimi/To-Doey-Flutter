// foundation indeholder klassen ChangeNotifier
// bruges til at styre state og give besked til widgets, når data ændres
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
// Indeholder samlinger som fx UnmodifiableListView
import 'dart:collection';

// extend ChangeNotifier : notify til andre widgets, når data ændres.
// ChangeNotifier er typisk sammen med Provider
class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  // betyder en liste, der ikke kan ændres udefra — den er kun read-only
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  // Returnerer kun længden, ændrer intet – så ingen notifyListeners() nødvendig
  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    // Kalder notifyListeners() for at fortælle alle widgets, der lytter til
    // TaskData, at data er blevet ændret, så de kan opdatere sig selv.
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

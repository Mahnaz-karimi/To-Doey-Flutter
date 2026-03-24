import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Consumer<TaskData>: Provider-widget, der lytter til ændringer i TaskData
    // Kun den del af widget-træet bliver genopbygget, ikke hele skærmen
    return Consumer<TaskData>(
      // TaskData: instans af TaskData-classen som kalder Provideren
      // Builder kan modtage et child, som ikke genopbygges ved ændringer
      builder: (context, taskData, child) {
        // listView  her indeholder en itemBuilder og en itemCount og loopes
        return ListView.builder(
          // itemBuilder: en funktion, der opretter hvert element i listen
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              // opdatere tjek-boks status
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              // longPressCallback: kaldes, når et element holdes nede
              // deleteTask bliver kaldt, og tasken slettes
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          // itemCount: angiver hvor mange elementer itemBuilder skal bygge
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

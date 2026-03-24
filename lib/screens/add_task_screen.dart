import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // Provider.of<TaskData>(context) uden listen: false kan forårsage uendelige
  // genopbygninger (endless rebuilds). Det er bedst at bruge const for
  // statiske widgets (for bedre ydeevne).
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // '?': Gøre nullable da bruger måske ikke indtaster noget
    String? newTaskTitle;
    // Ydre container: grå baggrund
    // Indre container: hvid panel med rundede hjørner og padding
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Color(0xFFC7ABDA)),
            ),
            TextField(
              // åbner keybord
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(height: 10),
            // TextButton: knap til at tilføje task
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFC7ABDA),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              onPressed: () {
                // .trim() fjerner mellemrum i starten og slutningen af teksten
                if (newTaskTitle != null && newTaskTitle!.trim().isNotEmpty) {
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(newTaskTitle!.trim());
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

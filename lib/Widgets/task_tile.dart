import 'package:flutter/material.dart';

// StatelessWidget: ændrer ikke intern state, updates sker via isChecked
class TaskTile extends StatelessWidget {
  // isChecked: status for checkbox
  final bool isChecked;
  // taskTitle: titel på task
  final String? taskTitle;
  // checkboxCallback: kaldes når checkbox ændres
  final ValueChanged<bool?>? checkboxCallback;
  // longPressCallback: kaldes ved langt tryk
  final GestureLongPressCallback? longPressCallback;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    this.checkboxCallback,
    this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile: viser task, håndterer langt tryk. den bruger tre parameter her:
    // onLongPress, title, trailing
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(
          // ændrer teksten og sætter en streg over den, hvis isChecked er true
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      // Checkbox: viser og opdaterer isChecked, kalder checkboxCallback ved ændring
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

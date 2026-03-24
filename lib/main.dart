import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';

void main() {
  runApp(const Todoey());
}

class Todoey extends StatelessWidget {
  const Todoey({super.key});
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider giver adgang til TaskData i hele appen
    return ChangeNotifierProvider(
      // her oprettes TaskData-provider'en
      create: (context) => TaskData(),
      child: MaterialApp(
        // Fjerner den røde "Debug"-banner fra skærmen
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}

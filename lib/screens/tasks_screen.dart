// Material-pakken giver UI-widgets (fx Scaffold, Text, FloatingActionButton)
import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
// Provider håndterer state og giver widgets mulighed for at lytte til TaskData
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

// StatelessWidget: ingen intern state
// Data modtages gennem Provider (TaskData)
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7ABDA),
      // flydende knap nederst, åbner AddTaskScreen ved tryk.
      floatingActionButton: FloatingActionButton(
        //
        backgroundColor: Color(0xFFC7ABDA),
        child: Icon(Icons.add),
        onPressed: () {
          // viser et modalvindue fra bunden af skærmen
          showModalBottomSheet(
            context: context,
            // Som standard vil BottomSheet optage halvdelen af skærmen.
            //  kan du få modalvinduet til at fylde hele skærmen.
            isScrollControlled: true,

            // SingleChildScrollView gør indholdet scrollbart,
            // og bestemmer padding nederst ved hjælp af en MediaQuery.
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  //viewInsets.bottom: at indholdet flyttes op,
                  // så det stadig kan ses
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            // Alle elementer på siden er inde i denne Column (top til bund)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  // en rundte som kan indeeholde icon i sig
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.list, size: 30.0, color: Color(0xFFC7A9DF)),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  // taskCount: antal af de opgaver fra TaskData via Provider,
                  // Provider hjælper med automatiskopdatering når data ændres
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              // BoxDecoration: Boksen indeholder en liste fra TasksList-widget
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              // TasksList indeholder en listview som indeholder en ListTile
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

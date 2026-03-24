# todoey_flutter

main.dart (Todoey)
    └─ ChangeNotifierProvider -> TaskData
        │
        └─ TasksScreen (home)
            ├─ Header (Icon + Text + taskCount via Provider.of<TaskData>)
            └─ Expanded -> Container (BoxDecoration)
                └─ TasksList (Consumer<TaskData>)
                    └─ ListView.builder (loop)
                        └─ TaskTile (per task)
                            ├─ title: Text (taskTitle, evt. line-through hvis isChecked)
                            ├─ trailing: Checkbox (isChecked, onChanged -> checkboxCallback)
                            └─ onLongPress: longPressCallback (sletter opgaven)


AddTaskScreen (opened by FAB -> showModalBottomSheet)
    └─ TextField -> newTaskTitle
    └─ Button -> Provider.of<TaskData>(listen:false).addTask(...)


# 📝 Todoey – En simpel To-Do app i Flutter

Denne app demonstrerer brugen af **Provider** og **ChangeNotifier** til state management i Flutter.

---

## 📂 Struktur og klasser

### 🧱 `task.dart`

En simpel modelklasse for én opgave (Task).

* `name`: String – navnet på opgaven.
* `isDone`: bool – om opgaven er markeret som færdig.
* `toggleDone()`: vender værdien af `isDone`.

### 📦 `task_data.dart`

En **ChangeNotifier**-klasse, som styrer alle opgaver.

* Indeholder en privat liste `_tasks`.
* `tasks`: giver en **UnmodifiableListView**, så andre widgets kun kan læse listen.
* `addTask()`, `updateTask()`, `deleteTask()` – ændrer listen og kalder `notifyListeners()` for at opdatere UI.

### 🖥️ `tasks_screen.dart`

Hovedskærmen i appen.

* Viser antallet af opgaver via `Provider.of<TaskData>(context).taskCount`.
* Har en **FloatingActionButton**, der åbner `AddTaskScreen` som et **BottomSheet**.
* Indeholder `TasksList`, som viser alle opgaver.

### 📋 `tasks_list.dart`

Bruger en **Consumer<TaskData>** til at bygge en dynamisk liste.

* `ListView.builder` genererer en `TaskTile` for hver opgave.
* Opdateres automatisk, når `notifyListeners()` kaldes i `TaskData`.

### ✅ `task_tile.dart`

En enkelt række (listeelement) med tekst og en checkbox.

* `isChecked`: viser, om opgaven er færdig.
* `checkboxCallback`: ændrer status på checkboxen.
* `longPressCallback`: sletter opgaven ved langt tryk.

### ➕ `add_task_screen.dart`

Et BottomSheet, hvor brugeren kan skrive en ny opgave.

* `TextField`: brugeren indtaster tekst.
* Tryk på **Add** → kalder `addTask()` via Provider og lukker skærmen.

### 🚀 `main.dart`

Indgangspunktet for appen.

* Opretter en **ChangeNotifierProvider**, som deler `TaskData` med hele appen.
* Starter `MaterialApp` med `TasksScreen` som hovedskærm.

---

## 💡 Nøglepunkter

* `ChangeNotifier` giver mulighed for at give besked til widgets, når data ændres.
* `Provider` gør det nemt at tilgå og opdatere data overalt i appen.
* `Consumer` bruges for at genopbygge kun de dele af UI’et, der behøver opdatering.

---

📘 **Kort sagt:**
Appen viser, hvordan man bygger en reaktiv To-Do-liste i Flutter med en enkel, effektiv struktur.



![Finished App](todoey_screens_demo.gif)
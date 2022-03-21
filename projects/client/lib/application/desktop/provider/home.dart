import 'package:dream/services/models/task.dart';
import 'package:dream/services/store/adapters/task.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomeProvider with ChangeNotifier {
  Task? _selectedTask;

  Task? get selectedTask => _selectedTask;
  set selectedTask(Task? task) {
    _selectedTask = task;
    notifyListeners();
  }

  List<Task> _items = List.empty();
  List<Task> get items => _items;
  List<TextEditingController> _controllers = List.empty();
  List<TextEditingController> get controllers => _controllers;

  HomeProvider() {
    queryTask().then((tasks) {
      _items = tasks.map((task) => task).toList();
      _controllers = List.generate(
          _items.length, (i) => TextEditingController(text: _items[i].name));
      notifyListeners();
    });
  }

  void addItem(String item) async {
    var uuid =  const Uuid();
    var key = uuid.v4().toString();
    var task = Task(key, item);
    await putTask(key, task);
    _items.add(task);
    _controllers.add(TextEditingController());
    notifyListeners();
  }

  void putItem(String key, String item) async {
    await putTask(key, Task(key, item));
  }

  @override
  void dispose() {
    super.dispose();
    for (TextEditingController c in _controllers) {
      c.dispose();
    }
  }
}

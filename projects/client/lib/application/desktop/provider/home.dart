import 'package:dream/services/models/task.dart';
import 'package:dream/services/store/adapters/task.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Task? _selectedTask;

  Task? get selectedTask => _selectedTask;
  set selectedTask(Task? task) {
    _selectedTask = task;
    notifyListeners();
  }

  List<Task> _items = List.empty();
  List<Task> get items => _items;

  Map<String, TextEditingController> _controllers = {};
  Map<String, TextEditingController> get controllers => _controllers;

  HomeProvider() {
    queryTask().then((tasks) {
      _items = tasks.map((task) => task).toList();
      _controllers = { for (var e in items) e.key : TextEditingController(text: e.title) };
      notifyListeners();
    });
  }

  void addItem(String item) async {
    var task = await Task.addItem(item, "");
    _items.add(task);
    _controllers[task.key] = TextEditingController(text: task.title);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((key, value) { value.dispose(); });
  }
}

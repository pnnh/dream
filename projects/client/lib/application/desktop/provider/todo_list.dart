import 'package:dream/services/store/models/task.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoListModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<List<String>> queryItems() async {
    var tasks = await queryTask();
    return tasks.map((task) => task.name).toList();
  }

  set selectedIndex(value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<Task?> getItem(String key) async {
    return getTask(key);
  }

  void putItem(String item) async {
    var uuid =  const Uuid();
    var key = uuid.v4().toString();

    await putTask(key, Task(key, item));
    notifyListeners();
  }
}

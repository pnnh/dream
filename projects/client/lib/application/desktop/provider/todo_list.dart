import 'package:dream/services/store/models/task.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoListModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<String> _items = List.empty();
  List<String> get items => _items;
  List<TextEditingController> _controllers = List.empty();
  List<TextEditingController> get controllers => _controllers;


  TodoListModel() {
    queryTask().then((tasks) {
      _items = tasks.map((task) => task.name).toList();
      _controllers = List.generate(
          _items.length, (i) => TextEditingController(text: _items[i]));
      notifyListeners();
    });
  }

  set selectedIndex(value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void addItem(String item) async {
    var uuid =  const Uuid();
    var key = uuid.v4().toString();

    await putTask(key, Task(key, item));
    _items.add(item);
    _controllers.add(TextEditingController());
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    for (TextEditingController c in _controllers) {
      c.dispose();
    }
  }
}

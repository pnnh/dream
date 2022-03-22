import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';

class TodoItem {
  TextEditingController controller;
  Task task;

  TodoItem(this.task, this.controller);
}

class TodoProvider with ChangeNotifier {
  TodoItem? _currentItem;

  TodoItem? get currentItem => _currentItem;

  selectItem(String key) {
    var item = items[key];
    if (item == null) {
      return;
    }
    _currentItem = item;
    notifyListeners();
  }

  final TaskStore _store = TaskStore();
  final Map<String, TodoItem> _items = {};

  Map<String, TodoItem> get items => _items;

  TodoProvider() {
    _store.queryValues().then((tasks) {
      for (var i = 0; i < tasks.toList().length; i++) {
        var task = tasks[i];
        var controller = TextEditingController(text: task.title);
        controller.addListener(() {
          putItem(task.key, controller.text, task.body);
        });
        var item = TodoItem(task, controller);
        _items[task.key] = item;
      }
      notifyListeners();
    });
  }

  void addItem(String item, String body) {
    _store.addItem(item, body).then((task) {
      var controller = TextEditingController(text: task.title);
      controller.addListener(() {
        putItem(task.key, controller.text, task.body);
      });
      _items[task.key] = TodoItem(task, controller);
      notifyListeners();
    });
  }

  TodoItem? getItem(String key) {
    return _items[key];
  }

  void putItem(String key, String title, String body) {
    var item = items[key];
    if (item == null) {
      return;
    }
    item.task.title = title;
    item.task.body = body;
    _store.putItem(key, item.task);
  }

  @override
  void dispose() {
    super.dispose();
    items.forEach((key, value) {
      value.controller.dispose();
    });
  }
}

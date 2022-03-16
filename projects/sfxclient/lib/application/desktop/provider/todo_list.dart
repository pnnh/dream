import 'package:flutter/material.dart';

class TodoListModel with ChangeNotifier {
  int _selectedIndex = 0;
  List<String> items = List<String>.generate(10, (i) => "Item $i");

  int get selectedIndex => _selectedIndex;

  set selectedIndex(value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}

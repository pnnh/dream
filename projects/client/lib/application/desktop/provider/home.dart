import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _showFilter = true;

  bool get showFilter => _showFilter;

  switchFilter() {
    _showFilter = !_showFilter;
    notifyListeners();
  }
}

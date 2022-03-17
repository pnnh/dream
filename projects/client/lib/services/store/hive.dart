import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
import 'models/task.dart';

Future<void> initStore() async {
  Directory current = Directory.current;
  print('current: ${current.path}');
  await Hive.initFlutter('store');
  Hive.registerAdapter(TaskAdapter());
}


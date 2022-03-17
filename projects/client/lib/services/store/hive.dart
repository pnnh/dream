import 'package:dream/services/store/adapters/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

Future<void> initStore() async {
  Directory current = Directory.current;
  print('current: ${current.path}');
  await Hive.initFlutter('store');
  Hive.registerAdapter(TaskAdapter());
}


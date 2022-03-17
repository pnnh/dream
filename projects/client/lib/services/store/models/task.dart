import 'dart:async';

import 'package:hive/hive.dart';

class Task {
  String key;
  String name;

  Task(this.key, this.name);

  @override
  String toString() => name;
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(reader.readString(), reader.readString());
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.key);
    writer.writeString(obj.name);
  }
}

Future<Task?> getTask(String key) async {
  var box = await Hive.openBox<Task>('tasks');

  return box.get(key);
}

Future<void> putTask(String key, Task task) async {
  var box = await Hive.openBox<Task>('tasks');

  box.put(key, task);
}

Future<Iterable<Task>> queryTask() async {
  var box = await Hive.openBox<Task>('tasks');
  return box.values;
}
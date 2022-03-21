
import 'package:dream/services/store/adapters/task.dart';
import 'package:uuid/uuid.dart';

class Task {
  String key;
  String title;
  String body;

  Task(this.key, this.title, this.body);

  @override
  String toString() => title;


  static Future<Task> addItem(String item, String body) async {
    var uuid =  const Uuid();
    var key = uuid.v4().toString();
    var task = Task(key, item, body);
    await putTask(key, task);
    return task;
  }

  static Future<void> putItem(String key, String item, String body) async {
    await putTask(key, Task(key, item, body));
  }
}

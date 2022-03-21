import 'package:dream/services/store/adapters/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';


Future<void> initStore() async {
  Directory current = Directory.current;
  print('current: ${current.path}');
  await Hive.initFlutter('store');
  Hive.registerAdapter(TaskAdapter());
}

class CacheStore<K, V> extends HiveStore {
  CacheStore (String store) : super(store) {

  }

  Map<K, V> _values = {};

  Future<V?> getValue(K key) async {
    var value = _values[key];
    if (value !=null) {
      return value;
    }

     value = await super.get<K, V>(key);

    if (value!=null) {
      _values[key] = value;
    }
    return value;
  }

  Future<void> putValue(K key, V value) async {
    _values[key] = value;
    await super.put(key, value);
  }

  Future<List<V>> query() async {
    if (_values.isNotEmpty) {
      return _values.values.toList();
    }
    var box = await Hive.openBox<V>('tasks');
    var boxKeys = box.keys.toList();
    var boxValues = box.values.toList();

    for(var i = 0; i < boxKeys.length; i++) {
      _values[boxKeys[i]] = boxValues[i];
    }

    return _values.values.toList();
  }

  Future<int> count() async {
    var values = await query();
    return values.length;
  }
}

class HiveStore {
  String store;
  HiveStore(this.store);

  Future<V?> get<K, V>(K key) async {
    var box = await Hive.openBox<V>(store);

    return box.get(key);
  }

  Future<void> put<K, V>(K key, V value) async {
    var box = await Hive.openBox<V>(store);
    return box.put(key, value);
  }
}
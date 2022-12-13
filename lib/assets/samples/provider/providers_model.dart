import 'package:flutter/material.dart';
//import 'package:nuts/nuts.dart';
//import 'package:provider/provider.dart';

class Task {
  String name;
  bool checked;

  Task(
    this.name, {
    this.checked = false,
  });
}

class Model with ChangeNotifier {
  late List<Task> _tasks;

  Model() {
    _tasks = <Task>[];
  }

  List<Task> get getAll => _tasks;
  int get length => _tasks.length;
  void get setState  => notifyListeners();

  set remove(int id) {
    _tasks.remove(_tasks[id]);
    notifyListeners();
  }

  set add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  set addList(List<Task> list) {
    _tasks = _tasks + list;
    notifyListeners();
  }

  get(int id) => _tasks[id];
  updateAt(int id, Task newValue) {
    if (_tasks[id].name == newValue.name &&
        _tasks[id].checked == newValue.checked) return;
    _tasks[id].name = newValue.name;
    _tasks[id].checked = newValue.checked;
    notifyListeners();
  }
}

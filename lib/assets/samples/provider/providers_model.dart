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
  late List<Task> tasks;

  Model() {
    tasks = <Task>[];
  }

  void get setState => notifyListeners();

}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'providers_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Model>(create: ((context) => Model())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      //direct operate Model Class without state management
      Model model = Provider.of<Model>(context, listen: false);
      int add = 15 - model.tasks.length;
      if (add > 0) {
        for (int i = 0; i < add; i++) {
          model.tasks.add(Task(
              "Task # ${Random().nextInt(10000).toString().padLeft(4, '0')}"));
        }
      }
      debugPrint(model.tasks.length.toString());
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TasksScreen(),
    );
  }
}

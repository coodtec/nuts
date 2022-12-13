import 'package:flutter/material.dart';
//import 'package:nuts/nuts.dart';
import 'package:provider/provider.dart';
import '../providers_model.dart';
import 'bottom_sheet.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: const ListTile(
          leading: CircleAvatar(
            radius: 40,
            child: Icon(
              Icons.list,
              size: 30,
            ),
          ),
          title: Text(
            "Todoey",
            style: TextStyle(fontSize: 35),
          ),
          subtitle: SubtitleText(),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Color.fromARGB(255, 11, 25, 48)),
          child: const Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: TaskView(),
            ),
          )),
      floatingActionButton: const MethodBottomSheet(),
    );
  }
}

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: ((context, model, child) {
        List<Task> tasks = (Provider.of<Model>(context)).getAll;
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: ((context, i) {
              Task t = tasks[i];
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: IconButton(
                    onPressed: (() {
                      model.remove = i;
                    }),
                    icon: const Icon(Icons.delete_outline)),
                title: Text(
                  t.name,
                  style: t.checked
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.blueGrey)
                      : null,
                ),
                trailing: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                      activeColor: Colors.white70,
                      checkColor: Colors.black,
                      value: t.checked,
                      onChanged: ((value) {
                        t.checked = value ?? false; //change directly without notify
                        model.setState;
                        //model.updateAt(i, t);
                      })),
                ),
              );
            }));
      }),
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${Provider.of<Model>(context).length}  tasks',
        style: const TextStyle(fontSize: 25));
  }
}

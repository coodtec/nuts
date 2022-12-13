import 'package:flutter/material.dart';
import 'package:nuts/nuts.dart';
import 'package:provider/provider.dart';
import '../providers_model.dart';

class MethodBottomSheet extends StatelessWidget {
  const MethodBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: ((context, model, child) {
        String inputName = "";
        return FloatingActionButton(
          onPressed: (() {
            showBottomSheet(
                context: context,
                builder: ((context) => ColoredBox(
                      color: const Color.fromARGB(255, 11, 25, 48),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: ScreenSize(context).height * 0.38,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              color: Color.fromARGB(255, 18, 40, 75)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const Center(
                                  child: Text(
                                    'Add Task',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onChanged: (value) => inputName = value,
                                ),
                                ElevatedButton(
                                  child: const Text('Add'),
                                  onPressed: () {
                                    if (inputName.isEmpty) return;
                                    debugPrint(inputName);
                                    model.add =Task(inputName);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )));
          }),
          child: const Icon(Icons.upload),
        );
      })
    );
  }
}

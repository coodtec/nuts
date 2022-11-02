import 'package:flutter/material.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Here is AppBar'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              ''' The simple page.

Click to return home page''',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

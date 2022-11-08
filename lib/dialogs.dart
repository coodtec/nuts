import 'package:flutter/material.dart';

class PopAlert {
  BuildContext context;
  String title;
  String message;

  PopAlert(
      {required this.context, required this.message, this.title = 'Alert'}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
/*           TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ), */
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PopAlert {
  BuildContext context;
  String title;
  String message;
  String actText;
  void Function()? onPressed; 

  PopAlert(
      {required this.context, 
      required this.message, 
      this.title = 'Alert',
      this.actText = 'OK',
      this.onPressed,
      }) {
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
            onPressed:  extendOnPressed(onPressed,context,actText),
            child: Text(actText),
          ),
        ],
      ),
    );
  }
}


Function()? extendOnPressed (Function()? onPressed, BuildContext context, String text){
  if (onPressed == null) {
    return () => Navigator.pop(context, 'OK');
  }
  else {
    return (() {
      onPressed;
      Navigator.pop(context, text);
    });
  }
}
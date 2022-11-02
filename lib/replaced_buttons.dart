library nuts;

import 'package:flutter/material.dart';

class FlatButton extends StatefulWidget {
  final Widget child;
  final Color color;// 
  final void Function()? onPressed;

  const FlatButton({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  @override
  State<FlatButton> createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.color)),
      child: widget.child,
      //print();
    );
  }
}


class RaisedButton extends ElevatedButton {
  const RaisedButton({
    super.key,
    required super.child, 
    required super.onPressed}) : super();
}

import 'package:flutter/material.dart';

class Block extends StatefulWidget {
  final Color color;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Widget child;

  const Block({
    super.key,
    this.color = const Color.fromARGB(255, 32, 30, 30),
    this.margin = const EdgeInsets.all(5.0),
    this.child = const SizedBox.shrink(),
    this.borderRadius = 5.0,
  });

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.color,
        ),
        child: widget.child,
      ),
    );
  }
}

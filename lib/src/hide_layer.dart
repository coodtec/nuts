part of nuts;

class HideCover extends StatefulWidget {
  final bool visible;
  final Widget child;

  const HideCover({
    super.key,
    required this.visible,
    required this.child,
  });

  @override
  State<HideCover> createState() => _HideCoverState();
}

class _HideCoverState extends State<HideCover> {
  @override
  Widget build(BuildContext context) {
    if (widget.visible) {
      return widget.child;
    } else {
      return const SizedBox(
        child: null,
      );
    }
  }
}

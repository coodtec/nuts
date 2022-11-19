part of nuts;

class PopAlert {
  BuildContext context;
  String title;
  String message;
  String actText;
  void Function()? onPressed;
  bool cancelButton;

  PopAlert({
    required this.context,
    required this.message,
    this.title = 'Alert',
    this.actText = 'OK',
    this.onPressed,
    this.cancelButton = false,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CancelButton(cancel: true,context: context,),
          TextButton(
            onPressed: layedOnPressed(onPressed, context, actText),
            child: Text(actText),
          ),
        ],
      ),
    );
  }
}


class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.cancel,
    required this.context,
  }) : super(key: key);

  final bool cancel;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    if (cancel) {
      return TextButton(
        onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text('Cancel'),
      );
    } else {
      return const SizedBox();
    }
  }
}

Function()? layedOnPressed(
    Function()? onPressed, BuildContext context, String text) {
  if (onPressed == null) {
    return () => Navigator.pop(context, 'OK');
  } else {
    return (() {
      onPressed;
      Navigator.pop(context, text);
    });
  }
}

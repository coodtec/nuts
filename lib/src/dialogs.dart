part of nuts;

Future<String> popAlert({
  required BuildContext context,
  required String message,
  String title = 'Alert',
  String ok = 'Ok',
  bool showCancel = false,
  String cancel = 'Cancel',
}) async {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(cancel),
    onPressed: () => Navigator.pop(context, cancel),
  );
  Widget continueButton = FlatButton(
    child: Text(ok),
    onPressed: () => Navigator.pop(context, ok),
  );

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          showCancel ? cancelButton : const SizedBox.shrink(),
          continueButton,
        ],
      );
    },
  );
}

void showScaffoldSnack(
    {required BuildContext context, required String message, int sec = 20}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: sec),
  ));
}

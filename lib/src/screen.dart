part of nuts;

class ScreenSize {
  ScreenSize(this.context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  final BuildContext context;
  late double width;
  late double height;

}

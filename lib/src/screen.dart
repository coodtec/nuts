part of  nuts;


class ScreenSize {
  ScreenSize(this.context);

  final BuildContext context;

  double width() => MediaQuery.of(context).size.width;

  double height() => MediaQuery.of(context).size.height;
}

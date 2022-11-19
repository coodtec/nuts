part of nuts;

class InkwellButton extends StatelessWidget {
  final IconData fasIcon;
  final String label;
  final double sizeIcon;
  final Color colorIcon;
  final double sizeLabel;
  final Color colorLabel;
  final void Function()? onTap;

  const InkwellButton({
    Key? key,
    required this.fasIcon,
    required this.label,
    required this.onTap,
    this.sizeIcon = 80,
    this.colorIcon = Colors.white,
    this.sizeLabel = 15,
    this.colorLabel = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            fasIcon, //FontAwesomeIcons.mars
            size: sizeIcon,
            color: colorIcon,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 239, 232, 240),
              ),
          ),
        ],
      ),
    );
  }
}

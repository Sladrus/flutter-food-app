import 'package:flutter/cupertino.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  double iconSize;
  double textSize;
  double space;
  IconWithText(
      {Key? key,
      required this.icon,
      this.iconSize = 14,
      this.textSize = 10,
      this.space = 2,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        SizedBox(
          width: space,
        ),
        SmallText(
          text: text,
          size: textSize,
        ),
      ],
    );
  }
}

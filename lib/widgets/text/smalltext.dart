import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_application/utils/colors.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;
  SmallText(
      {Key? key,
      this.color = const Color(0xffa0a0a0),
      required this.text,
      this.size = 12,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: size,
        shadows: [
          BoxShadow(
            color: color,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          )
        ],
      ),
    ));
  }
}

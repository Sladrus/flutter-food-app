import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_application/utils/colors.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  FontWeight fontWeight;
  TextOverflow overflow;
  TextAlign align;
  BigText(
      {Key? key,
      this.color = const Color(0xff151515),
      required this.text,
      this.size = 20,
      this.align = TextAlign.left,
      this.fontWeight = FontWeight.w500,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(
      text,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
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

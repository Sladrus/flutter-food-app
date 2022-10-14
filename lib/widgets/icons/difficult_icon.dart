import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';
import 'dart:developer';

class DifficultIcon extends StatelessWidget {
  String text;
  Color? color;
  double height;
  double textSize;
  DifficultIcon(
      {Key? key,
      required this.text,
      this.color,
      this.height = 20,
      this.textSize = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == 'Easy') {
      text = "Легко";
      color = AppColors.buttonColor1;
    }
    if (text == 'Medium') {
      text = "Средне";
      color = AppColors.buttonColor2;
    }
    if (text == 'Hard') {
      text = "Сложно";
      color = AppColors.buttonColor3;
    }
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 13),
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SmallText(text: text, color: Colors.white, size: textSize),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';

class StepsIcon extends StatelessWidget {
  final String text;
  Color color;
  Color textColor;
  double height;
  double textSize;
  String? difficult;

  StepsIcon({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    this.difficult,
    this.height = 20,
    this.textSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (difficult == 'Easy') {
      color = AppColors.buttonSoftColor1;
      textColor = AppColors.buttonColor1;
    }
    if (difficult == 'Medium') {
      color = AppColors.buttonSoftColor2;
      textColor = AppColors.buttonColor2;
    }
    if (difficult == 'Hard') {
      color = AppColors.buttonSoftColor3;
      textColor = AppColors.buttonColor3;
    }
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 13),
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SmallText(
          text: text,
          color: textColor,
          size: textSize,
        ),
      ),
    );
  }
}

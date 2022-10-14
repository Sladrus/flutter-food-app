import 'package:flutter/material.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/bigtext.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';

class RecipeInfoWidget extends StatelessWidget {
  final String bigText;
  Color bigTextColor = AppColors.buttonColor1;
  double bigTextSize = 16;
  final String smallText;
  double smallTextSize = 12;
  Color smallTextColor = AppColors.textColor1;

  double space = 5;
  RecipeInfoWidget({Key? key, required this.bigText, required this.smallText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          BigText(
            text: bigText,
            color: bigTextColor,
            size: bigTextSize,
          ),
          SizedBox(
            height: space,
          ),
          SmallText(
            text: smallText,
            color: smallTextColor,
            size: smallTextSize,
          )
        ],
      ),
    );
  }
}

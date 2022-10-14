import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/category_controller.dart';
import 'package:flutter_food_application/controllers/recipe_controller.dart';
import 'package:flutter_food_application/models/fav_model.dart';
import 'package:flutter_food_application/routes/route_hepler.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/bigtext.dart';
import 'package:flutter_food_application/widgets/icons/difficult_icon.dart';
import 'package:flutter_food_application/widgets/icons/iconwithtext.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';
import 'package:flutter_food_application/widgets/icons/stepsicon.dart';
import 'package:get/get.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<CategoryController>(builder: (recipeController) {
          var recipeLength = recipeController.getFavItems.length;
          var currentCategory = recipeController.currentIndex;
          return Column(
            children: [
              Container(
                  //Topbar
                  margin: const EdgeInsets.only(top: 55, bottom: 15),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.search,
                          size: 20,
                          color: AppColors.buttonColor1,
                          shadows: [
                            BoxShadow(
                              color: AppColors.buttonColor1,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(55),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ]),
                      ),
                      Column(
                        children: [
                          Container(
                            child: BigText(
                              text: AppConstants.APP_NAME,
                              size: 20,
                            ),
                          ),
                          SmallText(text: "Food recipes for you", size: 10)
                        ],
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(55),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ]),
                        child: Icon(
                          Icons.smartphone,
                          size: 20,
                          color: AppColors.buttonColor1,
                          shadows: [
                            BoxShadow(
                              color: AppColors.buttonColor1,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Center(
                child: BigText(
                  text: recipeLength == 1
                      ? "You have $recipeLength favorite recipe here:"
                      : "You have $recipeLength favorite recipes here:",
                  size: 14,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recipeLength,
                  itemBuilder: ((context, index) {
                    return _buildBottomListItem(
                        index, recipeController.getFavItems[index], currentCategory);
                  })),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildBottomListItem(int index, FavModel recipeData, int currentCategory) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getFavDetail(recipeData.id!, currentCategory));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOADS_URI +
                        recipeData.thumbnail!)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: recipeData.title!,
                      size: 14,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconWithText(
                            icon: Icons.star,
                            text: "4.2",
                            iconColor: AppColors.buttonColor1),
                        const SizedBox(
                          width: 10,
                        ),
                        IconWithText(
                          icon: Icons.food_bank,
                          text: recipeData.kcal!,
                          iconColor: AppColors.textColor1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconWithText(
                            icon: Icons.timelapse,
                            text: '${recipeData.time} минут',
                            iconColor: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        DifficultIcon(
                            text: recipeData.difficult!,
                            color: AppColors.buttonColor1),
                        const SizedBox(
                          width: 10,
                        ),
                        StepsIcon(
                            text: "4 steps",
                            difficult: recipeData.difficult!,
                            color: AppColors.buttonColor1.withOpacity(0.2),
                            textColor: AppColors.buttonColor1)
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

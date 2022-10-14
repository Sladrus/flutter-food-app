import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/category_controller.dart';
import 'package:flutter_food_application/models/category_model.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/bigtext.dart';
import 'package:flutter_food_application/widgets/icons/difficult_icon.dart';
import 'package:flutter_food_application/widgets/icons/iconwithtext.dart';
import 'package:flutter_food_application/widgets/text/recipeinfo.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';
import 'package:get/get.dart';

class FavDetail extends StatelessWidget {
  final int id;
  final int currentCategory;
  //bool fav = false;
  FavDetail({Key? key, required this.id, required this.currentCategory,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recipeController = Get.find<CategoryController>();
    var fav =
        recipeController.getFavItems.firstWhere((element) => element.id == id);
    log(id.toString());

    //Get.find<RecipeController>().initRecipe(recipe);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Container(
              //Topbar
              margin: const EdgeInsets.only(top: 55, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Icon(
                        Icons.arrow_back,
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
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 250,
                    child: BigText(
                      text: fav.title!,
                      align: TextAlign.center,
                      size: 16,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.clip,
                    ),
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
          Container(
            width: double.maxFinite,
            height: 150,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOADS_URI +
                        fav.thumbnail!))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: IconWithText(
                            icon: Icons.star,
                            iconColor: AppColors.buttonColor1,
                            iconSize: 14,
                            text: "4.6",
                            textSize: 12,
                            space: 3,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: IconWithText(
                            icon: Icons.timelapse,
                            iconColor: AppColors.buttonColor1,
                            iconSize: 14,
                            text: '${fav.time!} минут',
                            textSize: 12,
                            space: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 10),
                        child: DifficultIcon(
                          text: fav.difficult!,
                          color: AppColors.buttonColor1,
                          textSize: 12,
                          height: 24,
                        ),
                      )
                    ],
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RecipeInfoWidget(
                  bigText: fav.grams!,
                  smallText: 'Грамм',
                ),
                RecipeInfoWidget(
                  bigText: fav.kcal!,
                  smallText: 'Ккал',
                ),
                RecipeInfoWidget(
                  bigText: fav.fats!,
                  smallText: 'Жиры',
                ),
                RecipeInfoWidget(
                  bigText: fav.carbs!,
                  smallText: 'Углеводы',
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 45,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300]),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                      splashFactory: NoSplash.splashFactory,
                      labelColor: AppColors.textColor2,
                      unselectedLabelColor: AppColors.textColor1,
                      padding: EdgeInsets.all(0),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      //controller: _tabController,
                      tabs: [
                        Center(
                          child: Tab(
                            text: "Ingredients",
                          ),
                        ),
                        Center(
                          child: Tab(
                            text: "Recipe Details",
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
                //controller: _tabController,
                children: [
                  ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: fav.ingredients!.length,
                      itemBuilder: (context, length) {
                        return _recipeIngredientTile(fav.ingredients![length]);
                      }),
                  Container(
                      child: Center(child: BigText(text: "Recipe Details"))),
                ]),
          ),
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<CategoryController>(
                    builder: ((favController) {
                      var list = favController.categoryList[currentCategory].recipes; //<<<<
                      var recipe = list.firstWhere((element) => element.id == fav.id);
                      return GestureDetector(
                        onTap: () {
                          if (favController.isExist(recipe) == false) {
                            favController.addItem(recipe);
                          } else {
                            favController.deleteItem(recipe);
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Icon(
                            recipeController.isExist(recipe) == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.buttonColor1,
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        color: AppColors.buttonColor1,
                      ),
                      child: Center(
                        child: SmallText(
                          text: "Start cooking",
                          color: Colors.white,
                          size: 14,
                        ),
                      )),
                ]),
          )
        ]),
      ),
    );
  }

  Widget _recipeIngredientTile(Ingredients ingredient) {
    return Container(
      height: 45,
      width: 45,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL +
                                          AppConstants.UPLOADS_URI +
                                          ingredient.ingredientType!.icon!,
                                    ))),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(
                      text: ingredient.ingredientType!.title!,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmallText(
                      text: ingredient.amount!,
                      size: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.buttonColor1),
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

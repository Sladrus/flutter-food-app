import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/category_controller.dart';
import 'package:flutter_food_application/models/category_model.dart';
import 'package:flutter_food_application/routes/route_hepler.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:flutter_food_application/widgets/text/bigtext.dart';
import 'package:flutter_food_application/widgets/icons/difficult_icon.dart';
import 'package:flutter_food_application/widgets/icons/iconwithtext.dart';
import 'package:flutter_food_application/widgets/text/smalltext.dart';
import 'package:flutter_food_application/widgets/icons/stepsicon.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.mainColor1,
      onRefresh: () async {
        //Get.find<RecipeController>().getRecipeList();
        Get.find<CategoryController>().getCategoryList();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
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
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              height: 140,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildTopListItem(index);
                  }),
            ),
            Container(
              child: GetBuilder<CategoryController>(
                builder: (categoryController) {
                  var currentIndex = categoryController.currentIndex;

                  var length = categoryController.isLoaded == true
                      ? categoryController
                          .categoryList[currentIndex]!.recipes.length
                      : 0;

                  return categoryController.isLoaded
                      ? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              height: 40,
                              child: GetBuilder<CategoryController>(
                                  builder: (categoryController) {
                                return categoryController.isLoaded
                                    ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: categoryController
                                            .categoryList.length,
                                        itemBuilder: ((context, index) {
                                          return _buildCategoryListItem(
                                              index,
                                              categoryController
                                                  .categoryList[index]);
                                        }),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                            color: AppColors.buttonColor1),
                                      );
                              }),
                            ),
                            ListView.builder(
                                padding: const EdgeInsets.only(top: 15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: length,
                                itemBuilder: (context, index) {
                                  return _buildBottomListItem(
                                      index,
                                      categoryController
                                          .categoryList[currentIndex]
                                          .recipes[index],
                                      currentIndex);
                                })
                          ],
                        )
                      : Container(
                          height: 400,
                          child: Center(
                            child: CircularProgressIndicator(
                                color: AppColors.buttonColor1),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopListItem(int index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: FadeInAnimation(
          child: Container(
            width: 250,
            margin: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://thumbs.dreamstime.com/b/concept-background-pattern-summer-food-fruit-slice-fresh-orange-lay-flat-green-color-bright-creative-design-minimal-179748785.jpg")),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  )
                ]),
            child: Container(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: BigText(
                        text: "Individual Recipes",
                        size: 18,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150,
                      child: SmallText(
                        text: "Free menu planning to suit your needs",
                        size: 12,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListItem(int index, CategoryData category) {
    var categoryController = Get.find<CategoryController>();
    var currentIndex = categoryController.currentIndex;

    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: () {
              Get.find<CategoryController>().setCurrentIndex(index);
              log(index.toString());
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: currentIndex == index
                    ? AppColors.mainColor1
                    : AppColors.mainColor2,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOADS_URI +
                              category.icon!)),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 15),
                      child: SmallText(
                          text: category.title!,
                          color: currentIndex == index
                              ? AppColors.textColor3
                              : AppColors.textColor2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomListItem(
      int index, RecipeData recipeData, int currentIndex) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: FadeInAnimation(
          //delay: Duration(seconds: 2),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(
                RouteHelper.getRecipeDetail(index, currentIndex),
              );
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
                          SizedBox(
                            width: 200,
                            child: BigText(
                              text: recipeData.title!,
                              size: 14,
                              overflow: TextOverflow.clip,
                            ),
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
                                  text: '${recipeData.time!} минут',
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
                                  color: AppColors.buttonSoftColor1,
                                  textColor: AppColors.buttonColor1)
                            ],
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

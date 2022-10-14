import 'dart:developer';

import 'package:flutter_food_application/pages/favorite/fav_detail.dart';
import 'package:flutter_food_application/pages/mainscreen.dart';
import 'package:flutter_food_application/pages/recipe/recipe_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String recipeDetail = "/recipe-detail";
  static const String favDetail = "/fav-detail";

  static String getInitial() => '$initial';
  static String getRecipeDetail(int index, int currentCategory) =>
      '$recipeDetail?index=$index&currentCategory=$currentCategory';
  static String getFavDetail(int id, int currentCategory) =>
      '$favDetail?id=$id&currentCategory=$currentCategory';

  static List<GetPage> routes = [
    GetPage(name: initial, fullscreenDialog: true, page: () => MainScreen()),
    GetPage(
      name: recipeDetail,
      fullscreenDialog: true,
      page: () {
        var index = Get.parameters['index'];
        var currentCategory = Get.parameters['currentCategory'];

        return RecipeDetail(
            index: int.parse(index!),
            currentCategory: int.parse(currentCategory!));
      },
    ),
    GetPage(
      name: favDetail,
      fullscreenDialog: true,
      page: () {
        var id = Get.parameters['id'];
        var currentCategory = Get.parameters['currentCategory'];

        return FavDetail(
            id: int.parse(id!), currentCategory: int.parse(currentCategory!));
      },
    ),
  ];
}

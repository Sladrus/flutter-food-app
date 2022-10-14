import 'package:flutter_food_application/api/api_client.dart';
import 'package:flutter_food_application/controllers/category_controller.dart';
import 'package:flutter_food_application/controllers/fav_controller.dart';
import 'package:flutter_food_application/controllers/recipe_controller.dart';
import 'package:flutter_food_application/repository/category_repo.dart';
import 'package:flutter_food_application/repository/fav_repo.dart';
import 'package:flutter_food_application/repository/recipe_repo.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  //Get.lazyPut(() => RecipeRepo(apiClient: Get.find()));
  Get.lazyPut(() => FavRepo());
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));

  //controller
  //Get.lazyPut(() => RecipeController(recipeRepo: Get.find()));
  Get.lazyPut(() => FavController(favRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
}

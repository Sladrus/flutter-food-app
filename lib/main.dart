import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/category_controller.dart';
import 'package:flutter_food_application/controllers/recipe_controller.dart';
import 'package:flutter_food_application/pages/favorite/fav_page.dart';
import 'package:flutter_food_application/pages/mainscreen.dart';
import 'package:flutter_food_application/pages/recipe/recipe_detail.dart';
import 'package:flutter_food_application/routes/route_hepler.dart';
import 'package:get/get.dart';
import 'controllers/fav_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.find<RecipeController>().getRecipeList();
    Get.find<CategoryController>().getCategoryList();
    Get.find<CategoryController>().initFavController(Get.find<FavController>());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      defaultTransition: Transition.fadeIn,
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_food_application/controllers/fav_controller.dart';
// import 'package:flutter_food_application/models/fav_model.dart';
// import 'package:flutter_food_application/repository/recipe_repo.dart';
// import 'package:flutter_food_application/utils/colors.dart';
// import 'package:get/get.dart';
// import 'dart:developer';

// class RecipeController extends GetxController {
//   final RecipeRepo recipeRepo;
//   RecipeController({required this.recipeRepo});

//   List<dynamic> _recipeList = [];
//   List<dynamic> get recipeList => _recipeList;

//   late FavController _favController;

//   bool _isLoaded = false;
//   bool get isLoaded => _isLoaded;

//   int _inFavItems = 0;
//   int get inFavItems => _inFavItems;

//   Future<void> getRecipeList() async {
//     Response response = await recipeRepo.getRecipeList();
//     if (response.statusCode == 200) {
//       _recipeList = [];
//       //_recipeList.addAll(RecipeModel.fromJson(response.body).data);
//       _isLoaded = true;
//       update();
//     }
//   }

//   void initFavController(FavController favController) {
//     _favController = favController;
//   }

//   void initRecipe(
//     RecipeData recipe,
//   ) {
//     var exist = false;
//     exist = _favController.existInFav(recipe);
//   }

//   void addItem(RecipeData recipe) {
//     _favController.addItem(recipe);
//     var title = recipe.title;

//     Get.snackbar("Recipe added",
//         "You have added the \"'$title'\" recipe to your favorites",
//         backgroundColor: AppColors.buttonColor1, colorText: Colors.white);
//     _favController.items.forEach((key, value) {
//       log("The id is " + value.id.toString());
//     });
//     update();
//   }

//   void deleteItem(RecipeData recipe) {
//     _favController.deleteItem(recipe);
//     var title = recipe.title;
//     Get.snackbar("Recipe deleted",
//         "You have deleted the \"'$title'\" recipe from your favorites",
//         backgroundColor: AppColors.buttonColor1, colorText: Colors.white);
//     _favController.items.forEach((key, value) {
//       log("The id is " + value.id.toString());
//     });
//     update();
//   }

//   bool isExist(RecipeData recipe) {
//     return _favController.existInFav(recipe);
//   }

//   int get totalItems {
//     return _favController.totalItems;
//   }

//   List<FavModel> get getFavItems {
//     return _favController.favItems;
//   }
// }

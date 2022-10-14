import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/fav_controller.dart';
import 'package:flutter_food_application/models/category_model.dart';
import 'package:flutter_food_application/models/fav_model.dart';
import 'package:flutter_food_application/repository/category_repo.dart';
import 'package:flutter_food_application/utils/colors.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryRepo categoryRepo;

  List<dynamic> _categoryList = [];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<dynamic> get categoryList => _categoryList;

    late FavController _favController;
    
  late bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _inFavItems = 0;
  int get inFavItems => _inFavItems;

  CategoryController({required this.categoryRepo});

  Future<void> getCategoryList() async {
    Response response = await categoryRepo.getCategoryList();
    if (response.statusCode == 200) {
      _categoryList = [];
      _categoryList.addAll(CategoryModel.fromJson(response.body).data);
      _isLoaded = true;
      update();
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  void initFavController(FavController favController) {
    _favController = favController;
  }

  void initRecipe(
    RecipeData recipe,
  ) {
    var exist = false;
    exist = _favController.existInFav(recipe);
  }

  void addItem(RecipeData recipe) {
    _favController.addItem(recipe);
    var title = recipe.title;

    Get.snackbar("Recipe added",
        "You have added the \"'$title'\" recipe to your favorites",
        backgroundColor: AppColors.buttonColor1, colorText: Colors.white);
    _favController.items.forEach((key, value) {
      log("The id is " + value.id.toString());
    });
    update();
  }

  void deleteItem(RecipeData recipe) {
    _favController.deleteItem(recipe);
    var title = recipe.title;
    Get.snackbar("Recipe deleted",
        "You have deleted the \"'$title'\" recipe from your favorites",
        backgroundColor: AppColors.buttonColor1, colorText: Colors.white);
    _favController.items.forEach((key, value) {
      log("The id is " + value.id.toString());
    });
    update();
  }

  bool isExist(RecipeData recipe) {
    return _favController.existInFav(recipe);
  }

  int get totalItems {
    return _favController.totalItems;
  }

  List<FavModel> get getFavItems {
    return _favController.favItems;
  }
}

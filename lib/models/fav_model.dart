import 'package:flutter_food_application/models/category_model.dart';
import 'package:flutter_food_application/models/recipe_model.dart';

class FavModel {
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  //Categories? categories;
  List<Ingredients>? ingredients;
  bool? isExist;
  String? grams;
  String? kcal;
  String? fats;
  String? carbs;
  String? difficult;
  String? time;

  FavModel(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      //this.categories,
      this.ingredients,
      this.grams,
      this.carbs,
      this.difficult,
      this.fats,
      this.kcal,
      this.time,
      this.isExist});
}

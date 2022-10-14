import 'package:flutter_food_application/models/category_model.dart';
import 'package:flutter_food_application/models/fav_model.dart';
import 'package:flutter_food_application/models/recipe_model.dart';
import 'package:flutter_food_application/repository/fav_repo.dart';
import 'package:get/get.dart';

class FavController extends GetxController {
  final FavRepo favRepo;
  FavController({required this.favRepo});
  Map<int, FavModel> _items = {};
  Map<int, FavModel> get items => _items;

  void addItem(RecipeData recipe) {
    if (_items.containsKey(recipe.id!)) {
      _items.update(
          recipe.id!,
          (value) => FavModel(
                id: value.id,
                title: value.title,
                thumbnail: value.thumbnail,
                description: value.description,
                ingredients: value.ingredients,
                grams: value.grams,
                kcal: value.kcal,
                fats: value.fats,
                carbs: value.carbs,
                time: value.time,
                difficult: value.difficult,
                isExist: true,
              ));
    } else {
      _items.putIfAbsent(
          recipe.id!,
          () => FavModel(
                id: recipe.id,
                title: recipe.title,
                thumbnail: recipe.thumbnail,
                description: recipe.description,
                ingredients: recipe.ingredients,
                grams: recipe.grams,
                kcal: recipe.kcal,
                fats: recipe.fats,
                carbs: recipe.carbs,
                time: recipe.time,
                difficult: recipe.difficult,
                isExist: true,
              ));
    }
  }

  void deleteItem(RecipeData recipe) {
    _items.removeWhere((key, value) => key == recipe.id);
  }

  void findItem(RecipeData recipe) {
    _items.removeWhere((key, value) => key == recipe.id);
  }

  bool existInFav(RecipeData recipe) {
    if (_items.containsKey(recipe.id)) {
      return true;
    } else {
      return false;
    }
  }

  bool existInFavById(int id) {
    if (_items.containsKey(id)) {
      return true;
    } else {
      return false;
    }
  }

  int get totalItems {
    var totalFavs = _items.length;
    return totalFavs;
  }

  List<FavModel> get favItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}

class CategoryModel {
  late List<CategoryData> _data;
  List<CategoryData> get data => _data;
  Meta? meta;

  CategoryModel({this.meta});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <CategoryData>[];
      json['data'].forEach((v) {
        _data.add(CategoryData.fromJson(v));
      });
    }
  }
}

class CategoryData {
  int? id;
  String? title;
  String? icon;
  late List<RecipeData> _recipes;
  List<RecipeData> get recipes => _recipes;

  CategoryData({this.id, this.title, this.icon});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    if (json['recipes'] != null) {
      _recipes = <RecipeData>[];
      json['recipes'].forEach((v) {
        _recipes.add(RecipeData.fromJson(v));
      });
    }
  }
}

class RecipeData {
  int? id;
  String? title;
  String? grams;
  String? kcal;
  String? fats;
  String? carbs;
  String? time;
  String? difficult;
  String? description;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;
  late List<Ingredients>? _ingredients;
  List<Ingredients>? get ingredients => _ingredients;

  RecipeData(
      {this.id,
      this.title,
      this.grams,
      this.kcal,
      this.fats,
      this.carbs,
      this.time,
      this.difficult,
      this.description,
      this.thumbnail,
      this.createdAt,
      this.updatedAt});

  RecipeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    grams = json['grams'];
    kcal = json['kcal'];
    fats = json['fats'];
    carbs = json['carbs'];
    time = json['time'];
    difficult = json['difficult'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ingredients'] != null) {
      _ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
  }
}

class Ingredients {
  int? id;
  String? amount;
  int? recipeId;
  int? ingredientId;
  String? createdAt;
  String? updatedAt;
  IngredientType? ingredientType;

  Ingredients(
      {this.id,
      this.amount,
      this.recipeId,
      this.ingredientId,
      this.createdAt,
      this.updatedAt,
      this.ingredientType});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    recipeId = json['recipe_id'];
    ingredientId = json['ingredient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ingredientType = json['ingredient_type'] != null
        ? IngredientType.fromJson(json['ingredient_type'])
        : null;
  }
}

class IngredientType {
  int? id;
  String? title;
  String? icon;
  String? createdAt;
  String? updatedAt;

  IngredientType(
      {this.id, this.title, this.icon, this.createdAt, this.updatedAt});

  IngredientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

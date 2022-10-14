//   class RecipeModel {
//   late List<RecipeData> _data;
//   List<RecipeData> get data => _data;

//   LinksModel? links;
//   Meta? meta;

//   RecipeModel({this.links, this.meta});

//   RecipeModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       _data = <RecipeData>[];
//       json['data'].forEach((v) {
//         _data!.add(RecipeData.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? LinksModel.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//   }
// }

// class RecipeData {
//   int? id;
//   String? title;
//   String? description;
//   String? thumbnail;
//   Categories? categories;
//   List<Ingredients>? ingredients;
//   String? grams;
//   String? kcal;
//   String? fats;
//   String? carbs;
//   String? difficult;
//   String? time;

//   RecipeData(
//       {this.id,
//       this.title,
//       this.description,
//       this.thumbnail,
//       this.categories,
//       this.ingredients,
//       this.grams,
//       this.carbs,
//       this.difficult,
//       this.fats,
//       this.kcal,
//       this.time});

//   RecipeData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     thumbnail = json['thumbnail'];
//     grams = json['grams'];
//     carbs = json['carbs'];
//     difficult = json['difficult'];
//     fats = json['fats'];
//     kcal = json['kcal'];
//     time = json['time'];

//     categories = json['categories'] != null
//         ? Categories.fromJson(json['categories'])
//         : null;
//     if (json['ingredients'] != null) {
//       ingredients = <Ingredients>[];
//       json['ingredients'].forEach((v) {
//         ingredients!.add(new Ingredients.fromJson(v));
//       });
//     }
//   }
// }

// class Categories {
//   int? id;
//   String? title;
//   String? icon;
//   String? createdAt;
//   String? updatedAt;

//   Categories({this.id, this.title, this.icon, this.createdAt, this.updatedAt});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     icon = json['icon'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }

// class Ingredients {
//   int? id;
//   String? amount;
//   IngredientType? ingredientType;

//   Ingredients({this.id, this.amount, this.ingredientType});

//   Ingredients.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     amount = json['amount'];
//     ingredientType = json['ingredientType'] != null
//         ? new IngredientType.fromJson(json['ingredientType'])
//         : null;
//   }
// }

// class IngredientType {
//   int? id;
//   String? title;
//   String? icon;
//   String? createdAt;
//   String? updatedAt;

//   IngredientType(
//       {this.id, this.title, this.icon, this.createdAt, this.updatedAt});

//   IngredientType.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     icon = json['icon'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }

// class LinksModel {
//   String? first;
//   String? last;
//   Null? prev;
//   Null? next;

//   LinksModel({this.first, this.last, this.prev, this.next});

//   LinksModel.fromJson(Map<String, dynamic> json) {
//     first = json['first'];
//     last = json['last'];
//     prev = json['prev'];
//     next = json['next'];
//   }
// }

// class Meta {
//   int? currentPage;
//   int? from;
//   int? lastPage;
//   String? path;
//   int? perPage;
//   int? to;
//   int? total;

//   Meta(
//       {this.currentPage,
//       this.from,
//       this.lastPage,
//       this.path,
//       this.perPage,
//       this.to,
//       this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }
// }

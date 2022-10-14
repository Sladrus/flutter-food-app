import 'package:flutter_food_application/api/api_client.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:get/get.dart';

class RecipeRepo extends GetxService {
  final ApiClient apiClient;
  RecipeRepo({required this.apiClient});

  Future<Response> getRecipeList() async {
    return await apiClient.getData(AppConstants.RECIPE_URI);
  }
}

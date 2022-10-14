import 'package:flutter_food_application/api/api_client.dart';
import 'package:flutter_food_application/utils/app_constants.dart';
import 'package:get/get.dart';

class CategoryRepo extends GetxService {
  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});

  Future<Response> getCategoryList() async {
    return await apiClient.getData(AppConstants.CATEGORY_URI);
  }
}

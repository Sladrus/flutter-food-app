import 'package:flutter/material.dart';
import 'package:flutter_food_application/controllers/fav_controller.dart';
import 'package:flutter_food_application/controllers/recipe_controller.dart';
import 'package:flutter_food_application/pages/favorite/fav_page.dart';
import 'package:flutter_food_application/pages/home/home_page.dart';
import 'package:flutter_food_application/pages/profile/profile_page.dart';
import 'package:flutter_food_application/pages/recipe/recipes_page.dart';
import 'package:flutter_food_application/widgets/appbottombar.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List screens = [
    HomePage(),
    RecipesPage(),
    FavPage(),
    ProfilePage(),
  ];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar:
          AppBottomBar(selectedIndex: selectedIndex, onClicked: onClicked),
    );
  }
}

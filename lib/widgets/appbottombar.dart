import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  AppBottomBar({Key? key, required this.selectedIndex, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color(0xffa0a0a0),
      selectedItemColor: const Color(0xff9ACD32),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 22,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
            ),
            label: "Recipes"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorites"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile"),
      ],
      onTap: onClicked,
      currentIndex: selectedIndex,
    );
  }
}

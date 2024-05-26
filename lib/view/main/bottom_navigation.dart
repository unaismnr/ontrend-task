import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.soup_kitchen_outlined,
          ),
          label: 'Food'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: 'Shop'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
          ),
          label: 'Cart'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2,
          ),
          label: 'Profile'),
    ]);
  }
}

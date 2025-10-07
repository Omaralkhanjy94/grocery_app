import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String imagePath;
  final Color circleColor;
  final VoidCallback? onTap;
  const Category({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.circleColor,
    required this.onTap,
  });
}

class Categories {
  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Vegetables',
        imagePath: 'assets/images/vegetables.png',
        circleColor: const Color(0xffE6F2EA),
        onTap: () {},
      ),
      Category(
        id: '2',
        name: 'Fruits',
        imagePath: 'assets/images/fruits.png',
        circleColor: const Color(0xffFFF0E5),
        onTap: () {},
      ),
      Category(
        id: '3',
        name: 'Beverages',
        imagePath: 'assets/images/beverages.png',
        circleColor: const Color(0xffFFF6E3),
        onTap: () {},
      ),
      Category(
        id: '4',
        name: 'Grocery',
        imagePath: 'assets/images/grocery.png',
        circleColor: const Color(0xffF3EFFA),
        onTap: () {},
      ),
      Category(
        id: '5',
        name: 'Edible oil',
        imagePath: 'assets/images/edible_oil.png',
        circleColor: const Color(0xffDCF4F5),
        onTap: () {},
      ),
      Category(
        id: '6',
        name: 'Household',
        imagePath: 'assets/images/Household.png',
        circleColor: const Color(0xffFFE8F2),
        onTap: () {},
      ),
    ];
  }
}

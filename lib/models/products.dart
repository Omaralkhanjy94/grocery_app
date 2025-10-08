import 'package:flutter/material.dart';

class Product {
  final String id;
  String name;
  String imagePath;
  double price;
  String? description;
  bool? isFavorite;
  Color? circleColor;
  VoidCallback? onTap;
  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.description,
    this.isFavorite = false,
    this.circleColor,
    this.onTap,
  });
}

class Products {
  static List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'Fresh Peach',
        imagePath: 'assets/images/peach.png',
        price: 8.00,
        description: 'dozen',
        circleColor: const Color(0xffFFF0E5),
        isFavorite: true,
        onTap: () {
          // todo: go to product details page
        },
      ),
      Product(
        id: '2',
        name: 'Avocado',
        imagePath: 'assets/images/avocado.png',
        price: 7.00,
        description: '2.0 lbs',
        circleColor: const Color(0xffE6F2EA),
        isFavorite: false,
        onTap: () {
          // todo: go to product details page
        },
      ),
      Product(
        id: '3',
        name: 'Pineapple',
        imagePath: 'assets/images/pineapple.png',
        price: 3.99,
        description: '1.50 lbs',
        circleColor: const Color(0xffFFF6E3),
        isFavorite: false,
        onTap: () {
          // todo: go to product details page
        },
      ),
      Product(
        id: '4',
        name: 'Broccoli',
        imagePath: 'assets/images/broccoli.png',
        price: 3.00,
        description: '1.0 kg',
        circleColor: const Color(0xffE6F2EA),
        isFavorite: true,
        onTap: () {
          // todo: go to product details page
        },
      ),
      Product(
        id: '5',
        name: 'Black Grapes',
        imagePath: 'assets/images/black_grapes.png',
        price: 7.05,
        description: '5.0 lbs',
        circleColor: const Color(0xFFE2F5AD),
        isFavorite: false,
        onTap: () {
          // todo: go to product details page
        },
      ),
      Product(
        id: '6',
        name: 'Pomegranate',
        imagePath: 'assets/images/pomegranate.png',
        price: 2.05,
        description: '1.5 lbs',
        circleColor: const Color(0xffFFF0E5),
        isFavorite: false,
        onTap: () {
          // todo: go to product details page
        },
      ),
    ];
  }
}

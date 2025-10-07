import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import '../models/products.dart' show Product;

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  ///Product name
  String get name => product.name;

  ///Product image
  String get imagePath => product.imagePath;

  ///Product price
  double get price => product.price;

  ///Product description
  String? get description => product.description;

  ///Product isFavorite
  bool? get isFavorite => product.isFavorite;
  set isFavorite(bool? value) {
    product.isFavorite = value;
  }

  ///Product circle color
  Color? get circleColor => product.circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Favorite Icon button at the top right corner
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavorite == true ? Icons.favorite : Icons.favorite_border,
                color: isFavorite == true ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                // Handle favorite button press
                product.isFavorite = !(product.isFavorite ?? false);
                (context as Element).markNeedsBuild();
              },
            ),
          ),
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: circleColor ?? Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment(0, -1.1),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff6CC51D),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Product Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //Product Description
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  description!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF868889),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

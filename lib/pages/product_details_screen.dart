import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_scaffold.dart';
import '../../models/products.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String get productName => widget.product.name;
  String get productDescription => widget.product.description!;
  double get productPrice => widget.product.price;
  String get productImagePath => widget.product.imagePath;

  ///favorite button state
  bool isFavorite = false;

  /// Build method to create the UI of the product details screen
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: productName,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Center(child: Image.asset(productImagePath)),
                  Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xFFF2FFE6)),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: SizedBox(
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    //Favorite button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                          size: 30,
                        ),
                      ),
                    ),
                    // Product details
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.6,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product price
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '\$${productPrice.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF28B446),
                              ),
                            ),
                          ),
                          // Product name
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              productName,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Product description
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              productDescription,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added $productName to cart.',
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Add to Cart'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

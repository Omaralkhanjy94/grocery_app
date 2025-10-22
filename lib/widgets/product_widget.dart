import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap;
  const ProductWidget({super.key, required this.product, this.onTap});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Product get product => widget.product;

  ///Product name
  String get name => product.name;

  ///Product image
  String get imagePath => product.imagePath;

  ///Product price
  double get price => product.price;

  ///Product description
  String? get description => product.note;

  ///Product isFavorite
  bool? get isFavorite => product.isFavorite;
  set isFavorite(bool? value) {
    product.isFavorite = value;
  }

  ///Product circle color
  Color? get circleColor => product.circleColor;

  ///On tap function
  VoidCallback? get onTap => widget.onTap;

  /// Whether the product has been added to the cart
  bool addedToCart = false;

  /// The quantity of the product in the cart
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('The product details page is under development.'),
              ),
            );
          },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: circleColor ?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  imagePath,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            8.height,
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
            4.height,
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
              Center(
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
            Divider(color: Color(0xFFEBEBEB)),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              height: 33,
              child: TextButton(
                onPressed: () {
                  //todo: Handle add to cart button press
                  setState(() {
                    addedToCart = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$name has been added to your cart.'),
                    ),
                  );
                },
                child: addedToCart
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                quantity--;
                                (context as Element).markNeedsBuild();
                              }
                              if (quantity == 1) {
                                setState(() {
                                  addedToCart = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '$name has been removed from your cart.',
                                      ),
                                    ),
                                  );
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 12,
                              color: Color(0xFF6CC51D),
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              quantity++;
                              (context as Element).markNeedsBuild();
                            },
                            icon: Icon(
                              Icons.add,
                              size: 16,
                              color: Color(0xFF6CC51D),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 16,
                            color: Color(0xFF6CC51D),
                          ),
                          5.width,
                          Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
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

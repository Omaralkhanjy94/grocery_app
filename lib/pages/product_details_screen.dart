import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String get productName => widget.product.name;
  String get productNote => widget.product.note!;
  String get productDescription => widget.product.description!;
  double get productPrice => widget.product.price;
  String get productImagePath => widget.product.imagePath;
  double get productRating => widget.product.rating!;
  Color get productCircleColor => widget.product.circleColor!;

  ///favorite button state
  bool isFavorite = false;

  /// product quantity
  int quantity = 1;

  /// Build method to create the UI of the product details screen
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: productName,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // product image
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, -1),
                        child: Container(
                          height: MediaQuery.sizeOf(context).width / 1.11,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: productCircleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(300),
                              bottomRight: Radius.circular(300),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 295,
                          width: 295,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(productImagePath),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 3,
                child: Container(
                  padding: 8.paddingAll,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF4F5F9),
                  ),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      //Favorite button
                      Positioned(
                        top: 0,
                        right: 16,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Color(0xFF868889),
                            size: 30,
                          ),
                        ),
                      ),
                      // Product details
                      Positioned(
                        top: 2,
                        left: 16,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product price
                            Text(
                              '\$${productPrice.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF28B446),
                              ),
                            ),
                            // Product name
                            Text(
                              productName,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Product note
                            Text(
                              productNote,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF868889),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            5.height,
                            // Product rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  productRating.toStringAsFixed(1),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                //rating stars
                                Rate(
                                  iconSize: 18,
                                  color: Color(0xFFFFC107),
                                  allowHalf: true,
                                  allowClear: false,
                                  initialValue: productRating,
                                  readOnly: true,
                                ),
                                //The Number of reviews
                                Text(
                                  "(89 reviews)",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF868889),
                                  ),
                                ),
                              ],
                            ),
                            10.height,

                            //Product description
                            productDescription.more(
                              trimLength:
                                  MediaQuery.sizeOf(context).width.toInt() -
                                  100,
                              textStyle: GoogleFonts.poppins(
                                color: Color(0xFF868889),
                                fontSize: 12,
                              ),
                              linkStyle: GoogleFonts.poppins(
                                color: Color(0xFF000000),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            10.height,
                            //Product quantity
                            Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    "Quantity",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF868889),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (quantity > 1) quantity--;
                                          });
                                        },
                                        child: Text(
                                          "-",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Color(0xFF6CC51D),
                                          ),
                                        ),
                                      ),
                                      15.width,
                                      VerticalDivider(
                                        color: Color(0xFFF4F5F9),

                                        thickness: 2,
                                      ),
                                      15.width,
                                      Text(
                                        quantity.toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      15.width,
                                      VerticalDivider(
                                        color: Color(0xFFF4F5F9),
                                        thickness: 2,
                                      ),
                                      15.width,
                                      //add
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        child: Text(
                                          "+",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Color(0xFF6CC51D),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            10.height,
                            //'Add to cart' button
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: 0.0.paddingAll,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //todo: ضع العنصر في قائمة المشتريات
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xFF6CC51D),
                                        content: Text(
                                          "Added $productName to the cart.",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: 0
                                        .paddingAll, // حتى يغطي التدرج كامل الزر
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ), // زوايا مستديرة
                                    ),
                                    backgroundColor: Colors
                                        .transparent, // اجعل الخلفية شفافة
                                    shadowColor: Colors
                                        .transparent, // حتى لا يختلط ظل الزر مع التدرج
                                  ),
                                  //Applying gradient to button
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffAEDC81),
                                          Color(0xff6CC51D),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 100,
                                        maxWidth: MediaQuery.sizeOf(
                                          context,
                                        ).width,
                                        minHeight: 47,
                                        maxHeight: 60,
                                      ), // حجم افتراضي
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 11,
                                            right: 5,
                                            child: Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
      ),
    );
  }
}

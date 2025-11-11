import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';
import '../../core/packages_manager/state_imports.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const ProductWidget({super.key, required this.product, this.onTap});

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
                  product.isFavorite == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.isFavorite == true ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // Handle favorite button press
                  // setState(() {
                  //   product.isFavorite = !product.isFavorite!;
                  // });
                  context.read<ProductsCubit>().toggleFavoriteStatus(product);
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
                  color: product.circleColor ?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  product.imagePath,
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
                  product.currency == "USA"
                      ? '\$${product.price.toStringAsFixed(2)}'
                      : '${product.price.toStringAsFixed(2)}${product.currency}',
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
                  product.name,
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
            if (product.description != null)
              Center(
                child: Text(
                  product.description!,
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
                  // Handle add to cart button press
                  if (context.read<AuthCubit>().state is AuthSuccess) {
                    // setState(() {
                    //   addedToCart = true;
                    // });
                    context.read<CartCubit>().addToCart(product);
                  } else {
                    Go.toName("/login");
                  }
                  //printing the result
                  allProductsToBePurchased.forEach((print));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${product.name} has been added to your cart.',
                      ),
                    ),
                  );
                },
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return state is CartInitial
                        ? Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6CC51D),
                            ),
                          )
                        : state is CartUpdated?
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<
                                ProductQuantityCubit,
                                ProductQuantityState
                              >(
                                builder: (context, state) {
                                  if (state is ProductQuantityInitial) {
                                    context
                                        .read<ProductQuantityCubit>()
                                        .initializeQuantity();
                                  } else if (state is ProductQuantityUpdated) {
                                    context
                                            .read<ProductQuantityCubit>()
                                            .quantity =
                                        state.quantity;
                                  } else if (state is ProductQuantityError) {
                                    return Text(
                                      state.message,
                                      style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  }
                                  return IconButton(
                                    onPressed: () {
                                      if (context
                                              .read<ProductQuantityCubit>()
                                              .quantity >
                                          1) {
                                        context
                                            .read<ProductQuantityCubit>()
                                            .quantity--;
                                      }
                                      (context as Element).markNeedsBuild();
                                      if (context
                                              .read<ProductQuantityCubit>()
                                              .quantity ==
                                          1) {
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(product);
                                        context
                                            .read<ProductQuantityCubit>()
                                            .initializeQuantity();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 12,
                                      color: Color(0xFF6CC51D),
                                    ),
                                  );
                                },
                              ),
                              Text(
                                context
                                    .read<ProductQuantityCubit>()
                                    .quantity
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<ProductQuantityCubit>()
                                      .incrementQuantity();
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
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

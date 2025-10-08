import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import '../../models/products.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/session_widget.dart';
import '../../models/categories.dart';
import '../../widgets/category_widget.dart';
import '../../extensions/customization_string.dart';
import '../../extensions/sized_box_x.dart';
import '../../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///Categories list
  final List<Category> categories = Categories.getCategories();

  ///Products list
  final List<Product> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //todo: Search Bar
                  SearchBar(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    ),
                    //Let the search bar background color from F4F5F9 to 868889
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.focused)) {
                        return const Color(0xff868889);
                      }
                      return const Color(0xffF4F5F9);
                    }),
                    leading: Icon(Icons.search, color: Color(0xff868889)),
                    trailing: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.tune, color: Color(0xff868889)),
                      ),
                    ],
                    hintText: 'Search Keywords..',
                    hintStyle: WidgetStateProperty.resolveWith((states) {
                      return TextStyle(
                        color: states.contains(WidgetState.focused)
                            ? Colors.white
                            : Color(0xff868889),
                      );
                    }),
                    onChanged: (value) {
                      // Handle search input change
                    },
                  ),
                  10.height,
                  //todo: cover image
                  // a text over the image that says "20% OFF on your first purchase"
                  Container(
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/home_screen_cover.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment(-0.5, 0.3), // left center
                      child: Text(
                        '20% OFF on your first purchase'.addNewLine(
                          maxLength: 15,
                        ),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //todo: categories
                  // A row with "Categories" text on the left and an arrow icon on the right
                  SessionWidget(
                    title: 'Categories',
                    onViewAllPressed: () {
                      // Handle view all categories action
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 5,
                      children: categories
                          .map((category) => CategoryWidget(category: category))
                          .toList(),
                    ),
                  ),
                  //todo: featured products
                  10.height,
                  SessionWidget(
                    title: 'Featured Products',
                    onViewAllPressed: () {
                      // Handle view all featured products action
                    },
                  ),
                  10.height,
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: products.length, // Number of featured products
                      itemBuilder: (context, index) {
                        return products
                            .map((product) => ProductWidget(product: product))
                            .toList()[index];
                      },
                    ),
                  ),
                  //todo: the bottom navigation bar
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

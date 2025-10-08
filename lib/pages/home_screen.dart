import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cover_widget.dart';
import '../../models/products.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/session_widget.dart';
import '../../models/categories.dart';
import '../../widgets/category_widget.dart';
import '../../extensions/sized_box_x.dart';
import '../../widgets/custom_scaffold.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///Categories list
  final List<Category> categories = Categories.getCategories();

  ///Products list
  final List<Product> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottomNavigationBar: PersistentTabView(
        screens: [],
        context,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.person_outline),
            title: "Profile",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.search),
            title: "Search",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_cart),
            title: "Cart",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        backgroundColor: Colors.white,
        navBarStyle: NavBarStyle.style6,
      ),
      title: 'Home',
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              //Done: Make a slide show of cover images by CoverWidget using PageView
              Flexible(flex: 2, fit: FlexFit.loose, child: offersSlideShow()),
              //Done: categories
              // A row with "Categories" text on the left and an arrow icon on the right
              SessionWidget(
                title: 'Categories',
                onViewAllPressed: () {
                  // Handle view all categories action
                },
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 5,
                    children: categories
                        .map((category) => CategoryWidget(category: category))
                        .toList(),
                  ),
                ),
              ),
              //Done: featured products
              SessionWidget(
                title: 'Featured Products',
                onViewAllPressed: () {
                  // Handle view all featured products action
                },
              ),
              //Featured Products Grid
              Flexible(
                flex: 3,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.60,
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
              // Stack(
              //   children: [
              //     Container(
              //       height: 80,
              //       color: Colors.white,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.home_outlined,
              //               color: Colors.black,
              //               size: 30,
              //             ),
              //           ),
              //           IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.person_outline,
              //               color: Colors.grey,
              //               size: 30,
              //             ),
              //           ),
              //           IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.favorite_border,
              //               color: Colors.grey,
              //               size: 30,
              //             ),
              //           ),
              //           SizedBox(width: 80, height: 80),
              //           // Empty space for FAB
              //         ],
              //       ),
              //     ),

              //     Positioned(
              //       right: 20,
              //       bottom: 20,
              //       child: Container(
              //         width: 50,
              //         height: 50,
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.white, width: 2),
              //           color: const Color(0xFF6CC51D),
              //           borderRadius: BorderRadius.circular(25),
              //         ),
              //         child: Center(
              //           child: IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.shopping_bag_outlined,
              //               color: Colors.white,
              //               size: 30,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget offersSlideShow() {
    return PageView(
      children: [
        CoverWidget(
          key: ValueKey(1),
          imagePath: 'assets/images/home_screen_cover.jpg',
          offerText: '20% OFF on your first purchase',
        ),
        CoverWidget(
          key: ValueKey(2),
          imagePath: 'assets/images/home_screen_cover.jpg',
          offerText: '30% OFF on your second purchase',
        ),
        CoverWidget(
          key: ValueKey(3),
          imagePath: 'assets/images/home_screen_cover.jpg',
          offerText: '40% OFF on your third purchase',
        ),
      ],
    );
  }
}

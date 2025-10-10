// Home Screen
// This screen displays the main content of the app, including categories and featured products.
// It uses a CustomScaffold for consistent layout and styling.
// It includes a search bar, a slideshow of cover images, and sections for categories and featured products.
import 'package:flutter/material.dart';

import '../../extensions/sized_box_x.dart';
import '../../models/categories.dart';
import '../../models/products.dart';
import '../../widgets/cover_widget.dart';
import '../../widgets/category_widget.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/session_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Categories list
  final List<Category> categories = Categories.getCategories();

  ///Products list
  final List<Product> products = Products.getProducts();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getSearchBar, //search bar
                  10.height,
                  //Done: Make a slide show of cover images by CoverWidget using PageView
                  getOffersSlideShow, //offers slide show
                  //Done: categories
                  // A row with "Categories" text on the left and an arrow icon on the right
                  SessionWidget(
                    title: 'Categories',
                    onViewAllPressed: () {
                      // Handle view all categories action
                    },
                  ),
                  //Categories list
                  getCategoriesList,
                  //Done: featured products
                  SessionWidget(
                    title: 'Featured Products',
                    onViewAllPressed: () {
                      // Handle view all featured products action
                    },
                  ),
                  //Featured Products Grid
                  getProductsGrid(products),
                  //todo: the bottom navigation bar
                  getBottomNavigationBar,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get offersSlideShow {
    return PageView(
      onPageChanged: (value) => setState(() {
        currentIndexNow = value;
      }),
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

  /// A method that returns a grid of products
  Widget getProductsGrid(List<Product> products) {
    return Flexible(
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
    );
  }

  /// A method that returns a search bar widget
  Widget get getSearchBar {
    return SearchBar(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
    );
  }

  int currentIndexNow = 0;

  /// A widget that displays indicator dots for the slideshow
  Widget get getIndicatorDots {
    bool isTapped = false;
    return InkWell(
      onTap: () {
        // Handle tap on indicator dot
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Positioned(
        bottom: 50,
        left: 10,
        child: Row(
          children: List.generate(4, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: isTapped ? 20 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: currentIndexNow == index
                    ? Color(0xff6CC51D)
                    : Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// A widget that returns the offers slide show with indicator dots
  Widget get getOffersSlideShow {
    return Flexible(
      flex: 5,
      fit: FlexFit.loose,
      child: Stack(
        children: [
          //Slide show of cover images
          offersSlideShow,
          //indicator for the slideshow
          getIndicatorDots,
        ],
      ),
    );
  }

  /// A widget that returns a horizontal list of categories
  Widget get getCategoriesList {
    return Flexible(
      flex: 2,
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CategoryWidget(category: categories[index]),
            );
          },
        ),
      ),
    );
  }

  /// A widget that returns a bottom navigation bar
  Widget get getBottomNavigationBar {
    return Stack(
      children: [
        Container(
          height: 80,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              SizedBox(width: 80, height: 80),
              // Empty space for FAB
            ],
          ),
        ),

        Positioned(
          right: 20,
          bottom: 20,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: const Color(0xFF6CC51D),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

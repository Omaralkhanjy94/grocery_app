// Home Screen
// This screen displays the main content of the app, including categories and featured products.
// It uses a CustomScaffold for consistent layout and styling.
// It includes a search bar, a slideshow of cover images, and sections for categories and featured products.
import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';
import '../../core/packages_manager/state_imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // Home Body
  // This widget builds the main body of the HomeScreen, including the cover image, categories, and featured products.

  ///Categories list
  final List<Category> categories = Categories.getCategories();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: buildBody(context),
      showBottomNavigationsBar: true,
      bottomNavigationBar: //Done: the bottom navigation bar
          getBottomNavigationBar,
    );
  }

  /// A method that returns the main body widget
  Widget buildBody(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsError) {
          return Center(child: Text(state.message));
        } else if (state is ProductsLoaded) {
          return safeArea(context, state.products);
        } else {
          return const Center(child: Text("No products available."));
        }
      },
    );
  }

  Widget panelContent(BuildContext context, List<Product> products) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //Done: search bar
          getSearchBar(),
          10.height,

          //[Done]: Make a slide show of cover images by CoverWidget using PageView
          getOffersSlideShow(context), //offers slide show
          //Done: categories
          // A row with "Categories" text on the left and an arrow icon on the right
          SessionWidget(
            title: 'Categories',
            onViewAllPressed: () {
              // Handle view all categories action
              Go.toName("/all_categories");
            },
          ),

          //Categories list
          getCategoriesList,

          //Done: featured products
          SessionWidget(
            title: 'Featured Products',
            onViewAllPressed: () {
              // Handle view all featured products action
              Go.toName("/featured_products");
            },
          ),

          //Featured Products Grid
          for (int i = 0; i < products.length; i += 2)
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ProductWidget(
                        product: products[i],
                        onTap: () =>
                            Go.to(ProductDetailsScreen(product: products[i])),
                      ),
                    ),
                    SizedBox(width: 10),
                    if (i + 1 < products.length)
                      Expanded(
                        child: ProductWidget(
                          product: products[i + 1],
                          onTap: () => Go.to(
                            ProductDetailsScreen(product: products[i + 1]),
                          ),
                        ),
                      )
                    else
                      Expanded(child: SizedBox()), // لو عدد العناصر فردي
                  ],
                ),
                10.height,
              ],
            ),
          120.height,
        ],
      ),
    );
  }

  //Wrap the panel in a SingleChildScrollView to make it scrollable
  Widget singleChildScrollView(BuildContext context, List<Product> products) {
    return SingleChildScrollView(child: panel(context, products));
  }

  //Wrap the panel content in a container with constraints to avoid overflow
  Widget panel(BuildContext context, List<Product> products) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: panelContent(context, products),
    );
  }

  //Wrap the SingleChildScrollView in a container with margin
  Widget mainBody(BuildContext context, List<Product> products) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: singleChildScrollView(context, products),
    );
  }

  //Wrap the main in a SafeArea to avoid notches and system UI
  Widget safeArea(BuildContext context, List<Product> products) {
    return SafeArea(child: mainBody(context, products));
  }

  /*CarouselSlider(
          carouselController: CarouselSliderController(),
          options: CarouselOptions(
            viewportFraction: 1,
            height: 300.0,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              // setState(() {
              //   currentIndexNow = index;
              // });
              context.read<OfferIndexCubit>().updateCurrentIndexCubit(index);
            },
          ),
          items: offers
              .map(
                (offer) => OfferBanner(
                  key: ValueKey(offers.indexOf(offer)),
                  imagePath: offer.imagePath,
                  offerText: offer.offerText,
                ),
              )
              .toList(),
        ); */
  /// A widget that returns a PageView for the offers slide show
  Widget offersSlideShow(BuildContext context) {
    return BlocBuilder<OfferIndexCubit, OfferIndexState>(
      builder: (context, state) {
        if (state is OfferIndexLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OfferIndexError) {
          return Center(child: Text(state.message));
        } else if (state is OfferIndexLoaded || state is OfferIndexUpdated) {
          final offers = Offers.getOffers();
          return CarouselSlider(
            carouselController: CarouselSliderController(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 300.0,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                // setState(() {
                //   currentIndexNow = index;
                // });
                context.read<OfferIndexCubit>().updateCurrentIndexCubit(index);
              },
            ),
            items: offers
                .map(
                  (offer) => OfferBanner(
                    key: ValueKey(offers.indexOf(offer)),
                    imagePath: offer.imagePath,
                    offerText: offer.offerText,
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(child: Text("No offers available."));
        }
      },
    );
  }

  /// A method that returns a search bar widget
  Widget getSearchBar() {
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
        //todo: Handle search input change
      },
    );
  }

  /// A widget that displays indicator dots for the slideshow
  Widget getIndicatorDots(BuildContext context) {
    return BlocBuilder<OfferIndexCubit, OfferIndexState>(
      builder: (context, state) {
        if (state is OfferIndexLoaded || state is OfferIndexUpdated) {
          final offers = state is OfferIndexLoaded
              ? state.offers
              : (state as OfferIndexUpdated).offers;
          return Positioned(
            bottom: 50,
            left: 30,
            child: Row(
              children: List.generate(offers.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width:
                      context.read<OfferIndexCubit>().currentIndexNow == index
                      ? 40
                      : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color:
                        context.read<OfferIndexCubit>().currentIndexNow == index
                        ? Color(0xff6CC51D)
                        : Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  /// A widget that returns the offers slide show with indicator dots
  Widget getOffersSlideShow(BuildContext context) {
    return Stack(
      children: [
        //Slide show of cover images
        offersSlideShow(context),
        //indicator for the slideshow
        getIndicatorDots(context),
      ],
    );
  }

  /// A widget that returns a horizontal list of categories
  Widget get getCategoriesList {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              categories[index].onTap;
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CategoryWidget(category: categories[index]),
            ),
          );
        },
      ),
    );
  }

  /// A widget that returns a bottom navigation bar
  Widget get getBottomNavigationBar {
    return CustomBottomNavigationsBar();
  }
}

part of 'home_screen.dart';

class _HomeScreenState extends State<HomeScreen> {
  // Home Body
  // This widget builds the main body of the HomeScreen, including the cover image, categories, and featured products.

  ///Categories list
  final List<Category> categories = Categories.getCategories();

  ///Products list
  final List<Product> products = Products.getProducts();

  ///Offers list
  final List<Offers> offers = Offers.getOffers();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: buildBody,
      bottomNavigationBar: //Done: the bottom navigation bar
          getBottomNavigationBar,
    );
  }

  /// A method that returns the main body widget
  Widget get buildBody {
    Widget panelContent = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //Done: search bar
          getSearchBar,
          10.height,

          //[Done]: Make a slide show of cover images by CoverWidget using PageView
          getOffersSlideShow, //offers slide show
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
            },
          ),

          //Featured Products Grid
          for (int i = 0; i < products.length; i += 2)
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
                      onTap: () =>
                          Go.to(ProductDetailsScreen(product: products[i + 1])),
                    ),
                  )
                else
                  Expanded(child: SizedBox()), // لو عدد العناصر فردي
              ],
            ),
        ],
      ),
    );

    //Wrap the panel content in a container with constraints to avoid overflow
    Widget panel = Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: panelContent,
    );

    //Wrap the panel in a SingleChildScrollView to make it scrollable
    Widget singleChildScrollView = SingleChildScrollView(child: panel);

    //Wrap the SingleChildScrollView in a container with margin
    Widget main = Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: singleChildScrollView,
    );

    //Wrap the main in a SafeArea to avoid notches and system UI
    Widget safeArea = SafeArea(child: main);
    return safeArea;
  }

  /// A widget that returns a PageView for the offers slide show
  Widget get offersSlideShow {
    return CarouselSlider(
      carouselController: CarouselSliderController(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 300.0,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndexNow = index;
          });
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
    return Positioned(
      bottom: 50,
      left: 30,
      child: Row(
        children: List.generate(offers.length, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            margin: EdgeInsets.symmetric(horizontal: 3),
            width: currentIndexNow == index ? 40 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: currentIndexNow == index
                  ? Color(0xff6CC51D)
                  : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        }),
      ),
    );
  }

  /// A widget that returns the offers slide show with indicator dots
  Widget get getOffersSlideShow {
    return Stack(
      children: [
        //Slide show of cover images
        offersSlideShow,
        //indicator for the slideshow
        getIndicatorDots,
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
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CategoryWidget(category: categories[index]),
          );
        },
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

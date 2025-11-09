import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/state_imports.dart'
    show
        ProductsCubit,
        ProductsInitial,
        ProductsState,
        ProductsLoading,
        ProductsError,
        ProductsLoaded;

class FeaturedProductsScreen extends StatelessWidget {
  const FeaturedProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBarButtons: true,
      showAppBar: true,
      backgroundColor: primaryColor,
      body:
          //GridView.builder
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                context.read<ProductsCubit>().fetchFeaturedProducts();
              } else if (state is ProductsLoading) {
                return Center(
                  child: CircularProgressIndicator(color: secondaryColor),
                );
              } else if (state is ProductsError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(color: secondaryColor),
                padding: EdgeInsets.all(10),
                child: Builder(
                  builder: (context) {
                    return GridView.builder(
                      itemCount: /*products.length*/ (state is ProductsLoaded
                          ? state.products.length
                          : 0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.55,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        // final product = products[index];
                        final product = (state is ProductsLoaded
                            ? state.products[index]
                            : null)!;
                        return ProductWidget(
                          product: product,
                          onTap: () =>
                              Go.to(ProductDetailsScreen(product: product)),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
      title: "Featured Products",
      appBarActions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.tune, size: 30)),
      ],
    );
  }
}

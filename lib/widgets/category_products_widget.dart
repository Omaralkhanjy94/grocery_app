import 'package:grocery_app/core/packages_manager/state_imports.dart';
import 'package:grocery_app/core/packages_manager/ui_imports.dart';
import 'package:grocery_app/core/packages_manager/network_imports.dart';
import 'package:grocery_app/core/packages_manager/data_imports.dart';

class CategoryProductsWidget extends StatelessWidget {
  final String title;
  final int categoryID;
  const CategoryProductsWidget(this.title, this.categoryID, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(),
      child: CustomScaffold(
        showAppBarButtons: true,
        showAppBar: true,
        backgroundColor: primaryColor,
        body:
            //GridView.builder
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsInitial) {
                  context.read<ProductsCubit>().fetchProductsByCategory(
                    categoryID,
                  );
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
                      // final filtered = products
                      //     .where((p) => p.categoryID == categoryID)
                      //     .toList();
                      final filtered = state is ProductsLoaded
                          ? state.products
                          : <Product>[];
                      return GridView.builder(
                        itemCount: filtered.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.55,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = filtered[index];
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
        title: title,
        appBarActions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.tune, size: 30)),
        ],
      ),
    );
  }
}

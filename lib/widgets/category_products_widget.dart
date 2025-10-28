import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/data_imports.dart';

class CategoryProductsWidget extends StatelessWidget {
  final String title;
  final int categoryID;
  CategoryProductsWidget(this.title, this.categoryID, {super.key});

  ///products list
  final List<Product> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBarButtons: true,
      showAppBar: true,
      backgroundColor: primaryColor,
      body:
          //GridView.builder
          Container(
            decoration: BoxDecoration(color: secondaryColor),
            padding: EdgeInsets.all(10),
            child: Builder(
              builder: (context) {
                final filtered = products
                    .where((p) => p.categoryID == categoryID)
                    .toList();
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
          ),
      title: title,
      appBarActions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.tune, size: 30)),
      ],
    );
  }
}

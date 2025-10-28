import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/extensions_imports.dart';
import '../core/packages_manager/data_imports.dart';

class VegetablesScreen extends StatefulWidget {
  const VegetablesScreen({super.key});

  @override
  State<VegetablesScreen> createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  ///products list
  List<Product> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBarButtons: true,
      showAppBar: true,
      backgroundColor: primaryColor,
      body: Container(
        decoration: BoxDecoration(color: secondaryColor),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 2,
            crossAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            if (products[index].categoryID == 1) {
              return ProductWidget(product: products[index]);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
      title: "Vegetables",
      appBarActions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.tune, size: 30)),
      ],
    );
  }
}

import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/data_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/extensions_imports.dart';

class FavoritesListScreen extends StatelessWidget {
  FavoritesListScreen({super.key});

  ///Products list
  final List<Product> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,

      body: Builder(
        builder: (context) {
          // get only favorite products
          final favorites = products.where((p) => p.isFavorite!).toList();

          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return ListTile(
                
                leading: CircleAvatar(
                  backgroundColor: product.circleColor,
                  radius: 100,
                  child: Image.asset(product.imagePath, height: 50, width: 50),
                ),
                title: Text(product.name),
                trailing: const Icon(Icons.favorite, color: Colors.red),
              );
            },
          );
        },
      ),
      title: "Favorites",
    );
  }
}

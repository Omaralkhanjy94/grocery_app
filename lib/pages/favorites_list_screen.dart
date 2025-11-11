import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/state_imports.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit()..fetchFavoriteProducts(),
      child: CustomScaffold(
        showAppBar: true,

        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              final favoriteProducts = state.products;
              if (favoriteProducts.isEmpty) {
                return const Center(child: Text("No favorite products found."));
              }
              return ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: product.circleColor,
                      child: Image.asset(product.imagePath),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.price.toStringAsFixed(2)}x"
                          "${product.quantity}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: accentColor,
                          ),
                        ),
                        Text(
                          product.name,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "\$${product.note}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: subtitleColor,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ProductsCubit>().removeFromFavorites(
                          product,
                        );
                      },
                      icon: Icon(Icons.favorite, color: accentColor),
                    ),
                  );
                },
              );
            } else if (state is ProductsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
        title: "Favorites",
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/packages_manager/data_imports.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  /// Simulated method to fetch products by category
  Future<void> fetchProductsByCategory(int categoryId) async {
    emit(ProductsLoading());
    try {
      // Simulate a network call to fetch products
      await Future.delayed(Duration(seconds: 2));
      // Dummy data for demonstration
      List<Product> products = List.generate(
        10,
        (index) => Product(
          id: Products.getProducts()[index % Products.getProducts().length].id,
          name: Products.getProducts()[index % Products.getProducts().length]
              .name,
          imagePath:
              Products.getProducts()[index % Products.getProducts().length]
                  .imagePath,
          categoryID:
              Products.getProducts()[index % Products.getProducts().length]
                  .categoryID,
          price: Products.getProducts()[index % Products.getProducts().length]
              .price,
        ),
      );
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError("Failed to fetch products: ${e.toString()}"));
    }
  }

  /// Simulated method to fetch featured products
  Future<void> fetchFeaturedProducts() async {
    emit(ProductsLoading());
    try {
      // Simulate a network call to fetch featured products
      await Future.delayed(Duration(seconds: 2));
      // Dummy data for demonstration
      List<Product> products = Products.getProducts().take(10).toList();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError("Failed to fetch featured products: ${e.toString()}"));
    }
  }

  /// Simulated method to fetch all products
  Future<void> fetchAllProducts() async {
    emit(ProductsLoading());
    try {
      // Simulate a network call to fetch all products
      await Future.delayed(Duration(seconds: 2));
      // Dummy data for demonstration
      List<Product> products = Products.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError("Failed to fetch all products: ${e.toString()}"));
    }
  }

  /// Simulated method to fetch all products that are marked as favorite
  Future<void> fetchFavoriteProducts() async {
    emit(ProductsLoading());
    try {
      // Simulate a network call to fetch favorite products
      await Future.delayed(Duration(seconds: 2));
      // Dummy data for demonstration
      List<Product> products = Products.getProducts()
          .where((p) => p.isFavorite == true)
          .toList();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError("Failed to fetch favorite products: ${e.toString()}"));
    }
  }

  /// Simulated method to toggle favorite status of a product
  void toggleFavoriteStatus(Product product) {
    product.isFavorite = !(product.isFavorite ?? false);
    emit(
      ProductsLoaded((state as ProductsLoaded).products),
    ); // Emit updated state
  }

  /// Increase product quantity
  void incrementQuantity(Product product) {
    product.quantity != product.quantity! + 1;
    try {
      emit(ProductsLoaded((state as ProductsLoaded).products));
    } on Exception catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  /// Decrease product quantity
  void decrementQuantity(Product product) {
    if (product.quantity! > 0) {
      product.quantity = product.quantity! - 1;
      try {
        emit(ProductsLoaded((state as ProductsLoaded).products));
      } on Exception catch (e) {
        emit(ProductsError(e.toString()));
      }
    }
  }

  /// Remove product from favorites
  void removeFromFavorites(Product product) {
    product.isFavorite = false;
    emit(
      ProductsLoaded((state as ProductsLoaded).products),
    ); // Emit updated state
  }
}

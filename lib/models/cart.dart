import '../../core/packages_manager/data_imports.dart' show Product;

class Cart {
  List<Product> productsToBePurchased;
  Cart({required this.productsToBePurchased});
  static void addProduct(Product product) {
    allProductsToBePurchased.add(product);
  }
}

List<Product> allProductsToBePurchased = [];

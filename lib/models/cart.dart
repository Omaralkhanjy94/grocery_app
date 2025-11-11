import '../../core/packages_manager/data_imports.dart' show Product;

class Cart {
  List<Product> productsToBePurchased;
  Cart({required this.productsToBePurchased});
  static void addProduct(Product product) {
    allProductsToBePurchased.add(product);
  }

  static void removeProduct(Product product) {
    allProductsToBePurchased.remove(product);
  }
}

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}

List<Product> allProductsToBePurchased = [];

class CartItems {
  static Map<Product, int> getCartItems() {
    final Map<Product, int> cartItemsMap = {};
    for (var product in allProductsToBePurchased) {
      if (cartItemsMap.containsKey(product)) {
        cartItemsMap[product] = cartItemsMap[product]! + 1;
      } else {
        cartItemsMap[product] = 1;
      }
    }
    return cartItemsMap;
  }
}

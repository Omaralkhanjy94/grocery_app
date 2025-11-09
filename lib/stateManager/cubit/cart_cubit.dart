import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:grocery_app/core/packages_manager/data_imports.dart'
    show Product, Products, Cart;

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(Product product) {
    // Logic to add product to cart
    Cart.addProduct(product);
  }

  void removeFromCart(Product product) {
    // Logic to remove product from cart
    Cart.removeProduct(product);
  }
}

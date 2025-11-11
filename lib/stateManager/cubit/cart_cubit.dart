import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/stateManager/cubit/auth_cubit.dart';
import 'package:meta/meta.dart';
import 'package:grocery_app/core/packages_manager/data_imports.dart'
    show Product, Cart, CartItems;

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void fetchCartItems() async {
    emit(CartLoading());
    try {
      final cartItems = CartItems.getCartItems();
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(CartError("Failed to load cart items"));
    }
  }

  void addToCart(Product product) {
    // Logic to add product to cart
    Cart.addProduct(product);
    try {
      emit(CartUpdated(CartItems.getCartItems()));
    } on Exception catch (e) {
      emit(CartError("Failed to update cart items: ${e.toString()}"));
    }
  }

  void removeFromCart(Product product) {
    // Logic to remove product from cart
    Cart.removeProduct(product);
    try {
      emit(CartUpdated(CartItems.getCartItems()));
    } on Exception catch (e) {
      emit(CartError("Failed to update cart items: ${e.toString()}"));
    }
  }
}

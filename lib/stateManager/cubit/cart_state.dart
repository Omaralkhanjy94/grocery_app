part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final Map<Product, int> cartItems; // Product and its quantity

  CartLoaded(this.cartItems);
}

final class CartUpdated extends CartState {
  final Map<Product, int> cartItems; // Product and its quantity

  CartUpdated(this.cartItems);
}

final class CartError extends CartState {
  final String message;

  CartError(this.message);
}

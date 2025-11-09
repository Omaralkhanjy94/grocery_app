part of 'product_quantity_cubit.dart';

@immutable
sealed class ProductQuantityState {}

final class ProductQuantityInitial extends ProductQuantityState {}

final class ProductQuantityUpdated extends ProductQuantityState {
  final int quantity;
  ProductQuantityUpdated(this.quantity);
}

final class ProductQuantityError extends ProductQuantityState {
  final String message;

  ProductQuantityError(this.message);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_quantity_state.dart';

class ProductQuantityCubit extends Cubit<ProductQuantityState> {
  int quantity = 0;
  ProductQuantityCubit() : super(ProductQuantityInitial());

  void initializeQuantity() {
    quantity = 0;
    emit(ProductQuantityUpdated(quantity));
  }

  void incrementQuantity() {
    quantity++;
    try {
      emit(ProductQuantityUpdated(quantity));
    } on Exception catch (e) {
      emit(ProductQuantityError(e.toString()));
    }
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
      try {
        emit(ProductQuantityUpdated(quantity));
      } on Exception catch (e) {
        emit(ProductQuantityError(e.toString()));
      }
    }
  }
}

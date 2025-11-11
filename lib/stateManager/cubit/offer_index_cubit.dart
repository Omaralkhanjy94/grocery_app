import 'package:grocery_app/models/offers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'offer_index_state.dart';

class OfferIndexCubit extends Cubit<OfferIndexState> {
  int currentIndexNow = 0;
  OfferIndexCubit() : super(OfferIndexInitial());

  /// Load offers into the cubit
  void loadOffersCubit() {
    emit(OfferIndexLoading());
    try {
      final offers = Offers.getOffers();
      emit(OfferIndexLoaded(offers));
    } catch (e) {
      emit(OfferIndexError(e.toString()));
    }
  }

  /// Update the current index of the offer slide show
  void updateCurrentIndexCubit(int index) {
    try {
      currentIndexNow = index;
      final offers = Offers.getOffers();
      emit(OfferIndexUpdated(offers));
    } catch (e) {
      emit(OfferIndexError(e.toString()));
    }
  }

  /// Fetch offers (simulated network call)
  Future<List<Offers>> fetchOffers() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return Offers.getOffers();
  }
}

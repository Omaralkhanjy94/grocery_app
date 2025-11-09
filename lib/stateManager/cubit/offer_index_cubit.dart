import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'offer_index_state.dart';

class OfferIndexCubit extends Cubit<OfferIndexState> {
  int currentIndexNow = 0;
  OfferIndexCubit() : super(OfferIndexInitial());

  void updateSplashCurrentIndexCubit(int index) {
    try {
      currentIndexNow = index;
      emit(OfferIndexUpdated());
    } catch (e) {
      emit(OfferIndexError(e.toString()));
    }
  }
}

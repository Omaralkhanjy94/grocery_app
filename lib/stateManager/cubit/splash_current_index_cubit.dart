import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_current_index_state.dart';

class SplashCurrentIndexCubit extends Cubit<SplashCurrentIndexState> {
  int currentIndexNow = 0;
  SplashCurrentIndexCubit() : super(SplashCurrentIndexInitial());

  void updateSplashCurrentIndexCubit(int index) {
    try {
      currentIndexNow = index;
      emit(SplashCurrentIndexUpdated());
    } catch (e) {
      emit(SplashCurrentIndexError(e.toString()));
    }
  }
}

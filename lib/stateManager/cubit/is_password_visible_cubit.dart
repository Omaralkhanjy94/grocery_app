import 'package:bloc/bloc.dart';
part 'is_password_visible_state.dart';

class IsPasswordVisibleCubit extends Cubit<IsPasswordVisibleState> {
  IsPasswordVisibleCubit() : super(IsPasswordVisibleInitial());

  /// Toggles the password visibility state
  void togglePasswordVisibility() {
    final currentState = state;
    if (currentState is IsPasswordVisible) {
      emit(IsPasswordVisible(!currentState.isVisible));
    } else {
      emit(IsPasswordVisible(true));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_form_position_state.dart';

class LoginFormPositionCubit extends Cubit<LoginFormPositionState> {
  double loginPagePositionTopR = 8.0;

  LoginFormPositionCubit() : super(LoginFormPositionInitial());
  void updatePosition(double newTopPosition) {
    try {
      loginPagePositionTopR = newTopPosition;
      emit(LoginFormPositionUpdated(newTopPosition));
    } catch (e) {
      emit(LoginFormPositionError(e.toString()));
    }
  }
}

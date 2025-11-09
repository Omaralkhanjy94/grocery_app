part of 'login_form_position_cubit.dart';

@immutable
sealed class LoginFormPositionState {}

final class LoginFormPositionInitial extends LoginFormPositionState {}

final class LoginFormPositionUpdated extends LoginFormPositionState {
  final double topPosition;
  LoginFormPositionUpdated(this.topPosition);
}

final class LoginFormPositionError extends LoginFormPositionState {
  final String errorMessage;
  LoginFormPositionError(this.errorMessage);
}

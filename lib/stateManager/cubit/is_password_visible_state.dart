part of 'is_password_visible_cubit.dart';

abstract class IsPasswordVisibleState {}

final class IsPasswordVisibleInitial extends IsPasswordVisibleState {}

final class IsPasswordVisible extends IsPasswordVisibleState {
  final bool isVisible;

  IsPasswordVisible(this.isVisible);
}

final class IsPasswordVisibleError extends IsPasswordVisibleState {
  final String message;

  IsPasswordVisibleError(this.message);
}

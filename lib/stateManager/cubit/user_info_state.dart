part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoLoaded extends UserInfoState {
  final User? user;

  UserInfoLoaded({
    this.user,
  });

  User get userInfo => user!;

  String? get userId => user?.id;
}

final class UserInfoError extends UserInfoState {
  final String message;

  UserInfoError({required this.message});
}

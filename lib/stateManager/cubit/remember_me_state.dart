part of 'remember_me_cubit.dart';

@immutable
sealed class RememberMeState {}

final class RememberMeInitial extends RememberMeState {}

final class RememberMeChecked extends RememberMeState {}

final class RememberMeUnchecked extends RememberMeState {}

part of 'splash_current_index_cubit.dart';

@immutable
sealed class SplashCurrentIndexState {}

final class SplashCurrentIndexInitial extends SplashCurrentIndexState {}

final class SplashCurrentIndexUpdated extends SplashCurrentIndexState {}

final class SplashCurrentIndexError extends SplashCurrentIndexState {
  final String message;
  SplashCurrentIndexError(this.message);
}

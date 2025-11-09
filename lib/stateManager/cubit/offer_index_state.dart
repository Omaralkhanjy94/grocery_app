part of 'offer_index_cubit.dart';

@immutable
sealed class OfferIndexState {}

final class OfferIndexInitial extends OfferIndexState {}

final class OfferIndexUpdated extends OfferIndexState {}

final class OfferIndexError extends OfferIndexState {
  final String message;
  OfferIndexError(this.message);
}

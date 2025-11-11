part of 'offer_index_cubit.dart';

@immutable
sealed class OfferIndexState {}

final class OfferIndexInitial extends OfferIndexState {}

final class OfferIndexLoading extends OfferIndexState {}

final class OfferIndexLoaded extends OfferIndexState {
  final List<Offers> offers;
  OfferIndexLoaded(this.offers);
}

final class OfferIndexUpdated extends OfferIndexState {
  final List<Offers> offers;
  OfferIndexUpdated(this.offers);
}

final class OfferIndexError extends OfferIndexState {
  final String message;
  OfferIndexError(this.message);
}

part of 'coin_details_bloc.dart';

abstract class CoinDetailsState extends Equatable {
  const CoinDetailsState();
}

class CoinDetailsInitial extends CoinDetailsState {
  @override
  List<Object> get props => [];
}

class CoinDetailsLoading extends CoinDetailsState {
  @override
  List<Object> get props => [];
}

class CoinDetailsLoaded extends CoinDetailsState {
  final List<PriceHistoryEntity> priceHistoryEntities;

  const CoinDetailsLoaded(this.priceHistoryEntities);


  @override
  List<Object> get props => [priceHistoryEntities];
}

class CoinDetailsError extends CoinDetailsState {
  final String errorMessage;

  const CoinDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

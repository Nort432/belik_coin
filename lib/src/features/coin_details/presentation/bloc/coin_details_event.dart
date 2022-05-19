part of 'coin_details_bloc.dart';

abstract class CoinDetailsEvent extends Equatable {
  const CoinDetailsEvent();
}

class CoinDetailsFetchCoin extends CoinDetailsEvent {
  const CoinDetailsFetchCoin(this.coinName);

  final String coinName;

  @override
  List<Object?> get props => [coinName];
}
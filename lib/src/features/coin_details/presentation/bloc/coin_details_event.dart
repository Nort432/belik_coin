part of 'coin_details_bloc.dart';

abstract class CoinDetailsEvent extends Equatable {
  const CoinDetailsEvent();
}

class CoinDetailsFetchCoin extends CoinDetailsEvent {
  const CoinDetailsFetchCoin({
    required this.coinName,
    required this.index,
  });

  final String coinName;
  final int index;


  @override
  List<Object?> get props => [coinName, index];
}

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
  final Stream? stream;
  final List<Series<PriceHistoryEntity, DateTime>> dataChart;
  final String name;

  const CoinDetailsLoaded({
    required this.stream,
    required this.dataChart,
    required this.name,
  });

  @override
  List<Object?> get props => [dataChart, stream, name];
}

class CoinDetailsError extends CoinDetailsState {
  final String errorMessage;

  const CoinDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

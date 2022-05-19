import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final DateTime time;
  final String assetIdBase;
  final String assetIdQuote;
  final double rate;

  const CoinEntity({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  @override
  List<Object> get props => [
    time,
    assetIdBase,
    assetIdQuote,
    rate,
  ];
}

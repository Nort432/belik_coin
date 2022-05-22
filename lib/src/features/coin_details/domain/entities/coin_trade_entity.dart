import 'package:equatable/equatable.dart';

class CoinTradeEntity extends Equatable {
  final DateTime lastDateTime;
  final double price;
  final String action;
  final String symbolId;

  const CoinTradeEntity({
    required this.lastDateTime,
    required this.price,
    required this.action,
    required this.symbolId,
});

  @override
  List<Object> get props => [
    lastDateTime,
    price,
    action,
    symbolId,
  ];
}
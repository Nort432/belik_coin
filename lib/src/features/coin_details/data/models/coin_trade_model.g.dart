// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_trade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinTradeModel _$CoinTradeModelFromJson(Map<String, dynamic> json) =>
    CoinTradeModel(
      lastDateTime: DateTime.parse(json['time_coinapi'] as String? ?? '1969-07-20 20:18:04Z'),
      price: (json['price'] as num? ?? 0).toDouble(),
      action: json['taker_side'] as String? ?? '???',
      symbolId: json['symbol_id'] as String? ?? '???',
    );

Map<String, dynamic> _$CoinTradeModelToJson(CoinTradeModel instance) =>
    <String, dynamic>{
      'time_coinapi': instance.lastDateTime.toIso8601String(),
      'price': instance.price,
      'taker_side': instance.action,
      'symbol_id': instance.symbolId,
    };

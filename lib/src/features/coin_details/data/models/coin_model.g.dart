// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      time: DateTime.parse(json['time'] as String),
      assetIdBase: json['assetIdBase'] as String,
      assetIdQuote: json['assetIdQuote'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'assetIdBase': instance.assetIdBase,
      'assetIdQuote': instance.assetIdQuote,
      'rate': instance.rate,
    };

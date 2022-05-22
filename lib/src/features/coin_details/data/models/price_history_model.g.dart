// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceHistoryModel _$PriceHistoryModelFromJson(Map<String, dynamic> json) =>
    PriceHistoryModel(
      timeClose: DateTime.parse(json['time_close'] as String),
      rateClose: (json['rate_close'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceHistoryModelToJson(PriceHistoryModel instance) =>
    <String, dynamic>{
      'time_close': instance.timeClose.toIso8601String(),
      'rate_close': instance.rateClose,
    };

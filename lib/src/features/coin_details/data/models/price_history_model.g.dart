// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceHistoryModel _$PriceHistoryModelFromJson(Map<String, dynamic> json) =>
    PriceHistoryModel(
      timeClose: DateTime.parse(json['timeClose'] as String),
      rateClose: (json['rateClose'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceHistoryModelToJson(PriceHistoryModel instance) =>
    <String, dynamic>{
      'timeClose': instance.timeClose.toIso8601String(),
      'rateClose': instance.rateClose,
    };

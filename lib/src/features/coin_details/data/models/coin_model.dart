import 'package:belik_coin/src/features/coin_details/domain/entities/coin_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel extends CoinEntity {
  const CoinModel({
    required DateTime time,
    required String assetIdBase,
    required String assetIdQuote,
    required double rate,
  }) : super(
          time: time,
          assetIdBase: assetIdBase,
          assetIdQuote: assetIdQuote,
          rate: rate,
        );

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CoinModelToJson(this);
}

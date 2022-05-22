import 'package:belik_coin/src/features/coin_details/domain/entities/coin_trade_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_trade_model.g.dart';

@JsonSerializable()
class CoinTradeModel extends CoinTradeEntity {
  const CoinTradeModel({
    required DateTime lastDateTime,
    required double price,
    required String action,
    required String symbolId,
  }) : super(
          lastDateTime: lastDateTime,
          price: price,
          action: action,
    symbolId: symbolId,
        );

  factory CoinTradeModel.fromJson(Map<String, dynamic> json) =>
      _$CoinTradeModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CoinTradeModelToJson(this);
}

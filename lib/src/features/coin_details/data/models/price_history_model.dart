import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_history_model.g.dart';

@JsonSerializable()
class PriceHistoryModel extends PriceHistoryEntity {
  const PriceHistoryModel({
    required DateTime timeClose,
    required double rateClose,
  }) : super(
          timeClose: timeClose,
          rateClose: rateClose,
        );

  factory PriceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PriceHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceHistoryModelToJson(this);
}

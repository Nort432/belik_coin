import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:charts_flutter/flutter.dart';

class PageEntity {
  PageEntity({
    required this.dataChart,
    required this.stream,
    required this.name,
    required this.index,
});
  final List<Series<PriceHistoryEntity, DateTime>> dataChart;
  final Stream? stream;
  final String name;
   int index;
}
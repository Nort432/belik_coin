import 'package:belik_coin/src/features/coin_details/data/params/coin_params.dart';
import 'package:belik_coin/src/features/coin_details/data/params/price_history_params.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/coin_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';

import '../../../../core/states/data_state.dart';

abstract class CoinDetailsRepo {
  Future<DataState<CoinEntity>> fetchCoin(CoinParams coinParams);

  Future<DataState<List<PriceHistoryEntity>>> fetchPriceHistory(
      PriceHistoryParams priceHistoryParams);
}

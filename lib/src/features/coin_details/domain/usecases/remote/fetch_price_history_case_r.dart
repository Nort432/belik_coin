import 'package:belik_coin/src/features/coin_details/data/params/price_history_params.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/repo/coin_details_repo.dart';

import '../../../../../core/states/data_state.dart';
import '../../../../../core/usecases/use_case.dart';

class FetchPriceHistoryCaseR
    implements
        UseCase<DataState<List<PriceHistoryEntity>>, PriceHistoryParams> {
  const FetchPriceHistoryCaseR(this.coinDetailsRepo);

  final CoinDetailsRepo coinDetailsRepo;

  @override
  Future<DataState<List<PriceHistoryEntity>>> call(
    PriceHistoryParams priceHistoryParams,
  ) async {
    return await coinDetailsRepo.fetchPriceHistory(priceHistoryParams);
  }
}

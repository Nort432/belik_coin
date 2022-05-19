
import 'package:belik_coin/src/features/coin_details/data/params/coin_params.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/coin_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/repo/coin_details_repo.dart';

import '../../../../../core/states/data_state.dart';
import '../../../../../core/usecases/use_case.dart';

class FetchCoinCaseR
    implements UseCase<DataState<CoinEntity>, CoinParams> {
  const FetchCoinCaseR(this.coinDetailsRepo);

  final CoinDetailsRepo coinDetailsRepo;

  @override
  Future<DataState<CoinEntity>> call(CoinParams coinParams) async {
    return await coinDetailsRepo.fetchCoin(coinParams);
  }
}

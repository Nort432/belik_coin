import 'dart:io';

import 'package:belik_coin/src/features/coin_details/data/params/coin_params.dart';
import 'package:belik_coin/src/features/coin_details/data/params/price_history_params.dart';
import 'package:belik_coin/src/features/coin_details/data/sources/remote/coin_details_source.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/coin_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/states/data_state.dart';
import '../../domain/repo/coin_details_repo.dart';

class CoinDetailsRepoImpl implements CoinDetailsRepo {
  const CoinDetailsRepoImpl({
    required this.coinDetailsSource,
  });

  final CoinDetailsSource coinDetailsSource;

  @override
  Future<DataState<CoinEntity>> fetchCoin(CoinParams coinParams) async {
    try {
      final httpResponse = await coinDetailsSource.fetchCoin(
        pathAssetIdBase: coinParams.assetIdBase,
        pathAssetIdQuote: coinParams.assetIdQuote,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      throw DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
        type: DioErrorType.response,
      );
    } catch (e) {
      String errorMessage = DataFailed.doMessageError(e, StackTrace.current);
      return DataFailed(errorMessage);
    }
  }

  @override
  Future<DataState<List<PriceHistoryEntity>>> fetchPriceHistory(
    PriceHistoryParams priceHistoryParams,
  ) async {
    try {
      final httpResponse = await coinDetailsSource.fetchPriceHistory(
        pathAssetIdBase: priceHistoryParams.assetIdBase,
        pathAssetIdQuote: priceHistoryParams.assetIdQuote,
        queryPeriodId: priceHistoryParams.periodId,
        queryTimeStart: priceHistoryParams.timeStart,
        queryTimeEnd: priceHistoryParams.timeEnd,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      throw DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
        type: DioErrorType.response,
      );
    } catch (e) {
      String errorMessage = DataFailed.doMessageError(e, StackTrace.current);
      return DataFailed(errorMessage);
    }
  }
}

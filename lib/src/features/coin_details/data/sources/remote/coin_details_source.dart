import 'package:belik_coin/src/config/app_api/api_coin_details.dart';
import 'package:belik_coin/src/features/coin_details/data/models/coin_model.dart';
import 'package:belik_coin/src/features/coin_details/data/models/price_history_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../../config/app_api/app_api.dart';

part 'coin_details_source.g.dart';

@RestApi(baseUrl: AppApi.baseUrl)
abstract class CoinDetailsSource {
  factory CoinDetailsSource(Dio dio, {String baseUrl}) = _CoinDetailsSource;

  @GET(ApiCoinDetails.urlCoin)
  @Headers(AppApi.headers)
  Future<HttpResponse<CoinModel>> fetchCoin({
    @Path(ApiCoinDetails.pathAssetIdBase) required String pathAssetIdBase,
    @Path(ApiCoinDetails.pathAssetIdQuote) required String pathAssetIdQuote,
  });

  @GET(ApiCoinDetails.urlPriceHistory)
  @Headers(AppApi.headers)
  Future<HttpResponse<List<PriceHistoryModel>>> fetchPriceHistory({
    @Path(ApiCoinDetails.pathAssetIdBase) required String pathAssetIdBase,
    @Path(ApiCoinDetails.pathAssetIdQuote) required String pathAssetIdQuote,
    @Query(ApiCoinDetails.queryPeriodId) required String queryPeriodId,
    @Query(ApiCoinDetails.queryTimeStart) required String queryTimeStart,
    @Query(ApiCoinDetails.queryTimeEnd) required String queryTimeEnd,
  });
}

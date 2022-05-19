import 'package:belik_coin/src/features/coin_details/data/sources/remote/coin_details_source.dart';
import 'package:belik_coin/src/features/coin_details/domain/usecases/remote/fetch_coin_case_r.dart';
import 'package:belik_coin/src/features/coin_details/domain/usecases/remote/fetch_price_history_case_r.dart';
import 'package:belik_coin/src/features/coin_details/presentation/bloc/coin_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies (Sources)
  //#region Coin Details

  injector.registerSingleton<CoinDetailsSource>(CoinDetailsSource(injector()));

  //#endregion

  // UseCases
  //#region Coin Details

  injector.registerSingleton<FetchCoinCaseR>(FetchCoinCaseR(injector()));
  injector.registerSingleton<FetchPriceHistoryCaseR>(
      FetchPriceHistoryCaseR(injector()));

  //#endregion

  //BLoC
  //#region Coin Details

  injector.registerFactory<CoinDetailsBloc>(
      () => CoinDetailsBloc(fetchPriceHistoryCaseR: injector()));

  //#endregion
}

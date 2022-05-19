import 'dart:async';

import 'package:belik_coin/src/core/states/data_state.dart';
import 'package:belik_coin/src/features/coin_details/data/params/price_history_params.dart';
import 'package:belik_coin/src/features/coin_details/domain/usecases/remote/fetch_price_history_case_r.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/price_history_entity.dart';

part 'coin_details_event.dart';

part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  CoinDetailsBloc({
    required this.fetchPriceHistoryCaseR,
  }) : super(CoinDetailsInitial()) {
    on<CoinDetailsFetchCoin>(_fetchPriceHistory);
  }

  final FetchPriceHistoryCaseR fetchPriceHistoryCaseR;

  FutureOr<void> _fetchPriceHistory(
      CoinDetailsFetchCoin event,
    Emitter<CoinDetailsState> emit,
  ) async {
    emit(CoinDetailsLoading());

    final today = DateTime.now();
    final yesterday = DateTime(today.year, today.month, today.day - 1);

    final params = PriceHistoryParams(
      assetIdBase: event.coinName,
      periodId: '1HRS',
      timeEnd: yesterday.toString(),
      timeStart: yesterday.toString(),
    );
    final dsPriceHistory = await fetchPriceHistoryCaseR(params);

    if(dsPriceHistory is DataSuccess) {
      emit(CoinDetailsLoaded(dsPriceHistory.data as List<PriceHistoryEntity>));
    }

    if(dsPriceHistory is DataFailed) {
      emit(CoinDetailsError(dsPriceHistory.messageError!));
    }
  }
}

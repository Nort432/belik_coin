import 'dart:async';
import 'dart:convert';

import 'package:belik_coin/src/config/app_api/app_api.dart';
import 'package:belik_coin/src/config/app_helpers/date_time_helper.dart';
import 'package:belik_coin/src/core/states/data_state.dart';
import 'package:belik_coin/src/features/coin_details/data/params/price_history_params.dart';
import 'package:belik_coin/src/features/coin_details/domain/usecases/remote/fetch_price_history_case_r.dart';
import 'package:bloc/bloc.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../config/app_api/web_coin_details.dart';
import '../../domain/entities/coin_name_entity.dart';
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
  WebSocketChannel? _channel;

  FutureOr<void> _fetchPriceHistory(
    CoinDetailsFetchCoin event,
    Emitter<CoinDetailsState> emit,
  ) async {
    emit(CoinDetailsLoading());

    final today = DateTime.now();
    final lastYear = DateTime(today.year - 1, today.month, today.day);

    final params = PriceHistoryParams(
      assetIdBase: event.coinName,
      periodId: '10DAY',
      timeEnd: today.toDateAPI(),
      timeStart: lastYear.toDateAPI(),
    );
    final dsPriceHistory = await fetchPriceHistoryCaseR(params);

    if (dsPriceHistory is DataSuccess) {
      _channel =
          WebSocketChannel.connect(Uri.parse(WebCoinDetails.urlCoinTrade));
      _channel?.sink.add(
        json.encode(
          {
            "type": "hello",
            "apikey": AppApi.apiKey,
            "heartbeat": false,
            "subscribe_data_type": ["trade"],
            "subscribe_filter_symbol_id": CoinNameEntity.id(event.coinName),
          },
        ),
      );

      final priceHistory = dsPriceHistory.data as List<PriceHistoryEntity>;
      Series<PriceHistoryEntity, DateTime> dataChart =
          Series<PriceHistoryEntity, DateTime>(
        id: 'PriceHistory',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (PriceHistoryEntity sales, _) => sales.timeClose,
        measureFn: (PriceHistoryEntity sales, count) => sales.rateClose,
        data: priceHistory,
      );

      return emit(
        CoinDetailsLoaded(
          stream: _channel?.stream,
          dataChart: [dataChart],
          name: event.coinName,
          index: event.index,
        ),
      );
    }

    if (dsPriceHistory is DataFailed) {
      emit(CoinDetailsError(dsPriceHistory.messageError!));
    }
  }

  @override
  Future<void> close() {
    _channel?.sink.close();
    return super.close();
  }
}

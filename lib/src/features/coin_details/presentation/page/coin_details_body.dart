import 'dart:convert';

import 'package:belik_coin/src/config/app_helpers/build_context_heleper.dart';
import 'package:belik_coin/src/config/app_helpers/date_time_helper.dart';
import 'package:belik_coin/src/features/coin_details/data/models/coin_trade_model.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/coin_name_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:belik_coin/src/features/coin_details/presentation/bloc/coin_details_bloc.dart';
import 'package:charts_flutter/flutter.dart' hide TextStyle;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/coin_data_widget.dart';
import '../widgets/price_chart_history_widget.dart';

class CoinDetailsBody extends StatelessWidget {
  const CoinDetailsBody({
    required this.dataChart,
    required this.name,
    this.stream,
    Key? key,
  }) : super(key: key);

  final List<Series<PriceHistoryEntity, DateTime>> dataChart;
  final Stream? stream;
  final String name;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<dynamic>(
              stream: stream,
              builder: (context, snapshot) {
                print('xxx');
                if (snapshot.hasData) {
                  final realData = CoinTradeModel.fromJson(
                      jsonDecode(snapshot.data.toString())
                          as Map<String, dynamic>);

                  return CoinDataWidget(
                    price: realData.price,
                    date: realData.lastDateTime.toDateTime(),
                    name: name,
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            Flexible(
                // height: 200,
                child: PriceChartHistoryWidget(
                  dataChart,
                  animate: true,
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money),
            label: locale.btc,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money),
            label: locale.eth,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money),
            label: locale.doge,
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context
                  .read<CoinDetailsBloc>()
                  .add(CoinDetailsFetchCoin(CoinNameEntity().bitcoin));
              break;
            case 1:
              context
                  .read<CoinDetailsBloc>()
                  .add(CoinDetailsFetchCoin(CoinNameEntity().ethereum));
              break;
            case 2:
              context
                  .read<CoinDetailsBloc>()
                  .add(CoinDetailsFetchCoin(CoinNameEntity().dogecoin));
              break;
          }
        },
      ),
    );
  }
}

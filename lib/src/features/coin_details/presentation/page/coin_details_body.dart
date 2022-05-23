import 'dart:convert';

import 'package:belik_coin/src/config/app_helpers/build_context_heleper.dart';
import 'package:belik_coin/src/config/app_helpers/date_time_helper.dart';
import 'package:belik_coin/src/features/coin_details/data/models/coin_trade_model.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/coin_name_entity.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/page_entity.dart';
import 'package:belik_coin/src/features/coin_details/presentation/bloc/coin_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/coin_data_widget.dart';
import '../widgets/price_chart_history_widget.dart';

class CoinDetailsBody extends StatelessWidget {
  const CoinDetailsBody({
    required this.pageEntity,
    Key? key,
  }) : super(key: key);

  final PageEntity pageEntity;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 10,
    );
    const padding = EdgeInsets.all(15);
    final locale = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(pageEntity.name),),
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: StreamBuilder<dynamic>(
                  stream: pageEntity.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final realData = CoinTradeModel.fromJson(
                          jsonDecode(snapshot.data.toString())
                              as Map<String, dynamic>);

                      return CoinDataWidget(
                        price: realData.price,
                        date: realData.lastDateTime.toDateTime(),
                        name: pageEntity.name,
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              space,
              Flexible(
                flex: 8,
                child: PriceChartHistoryWidget(
                  pageEntity.dataChart,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageEntity.index,
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
              pageEntity.index = index;
              context.read<CoinDetailsBloc>().add(
                    CoinDetailsFetchCoin(
                      index: 0,
                      coinName: CoinNameEntity().bitcoin,
                    ),
                  );
              break;
            case 1:
              pageEntity.index = index;
              context.read<CoinDetailsBloc>().add(
                CoinDetailsFetchCoin(
                  index: 1,
                  coinName: CoinNameEntity().ethereum,
                ),
              );
              break;
            case 2:
              pageEntity.index = index;
              context.read<CoinDetailsBloc>().add(
                CoinDetailsFetchCoin(
                  index: 2,
                  coinName: CoinNameEntity().dogecoin,
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

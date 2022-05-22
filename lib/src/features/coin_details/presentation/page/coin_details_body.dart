import 'dart:convert';

import 'package:belik_coin/src/config/app_helpers/date_time_helper.dart';
import 'package:belik_coin/src/features/coin_details/data/models/coin_trade_model.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:charts_flutter/flutter.dart' hide TextStyle;
import 'package:flutter/material.dart';

import '../widgets/coin_data_widget.dart';
import '../widgets/price_chart_history_widget.dart';

class CoinDetailsBody extends StatelessWidget {
  const CoinDetailsBody({required this.dataChart, this.stream, Key? key})
      : super(key: key);

  final List<Series<PriceHistoryEntity, DateTime>> dataChart;
  final Stream? stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
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
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            const Text('Hello'),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 200,
                child: PriceChartHistoryWidget(
                  dataChart,
                  animate: true,
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}

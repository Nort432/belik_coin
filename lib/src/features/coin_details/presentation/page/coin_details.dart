import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../widgets/price_chart_history_widget.dart';
import '../widgets/price_chart.dart';

class CoinDetails extends StatelessWidget {
  const CoinDetails({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // final WebSocketChannel channel = WebSocketChannel.connect(
    //   Uri.parse(''),
    // );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Hello'),
            const LineChartSample2(),
            const SizedBox(height: 15,),
            SizedBox(
                height: 200,
                child: PriceChartHistoryWidget.withSampleData()),
          ],
        ),
      ),
    );
  }
}
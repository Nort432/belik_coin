import 'package:belik_coin/src/config/app_helpers/build_context_heleper.dart';
import 'package:flutter/material.dart';

class CoinDataWidget extends StatelessWidget {
  const CoinDataWidget({Key? key,
  required this.price,
  required this.date,
  }) : super(key: key);

  final double price;
  final String date;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(locale.symbol),
              Text('BTC/USD'),
            ],
          ),
          Column(
            children: [
              Text(locale.price),
              Text('\$$price'),
            ],
          ),
          Column(
            children: [
              Text(locale.time),
              Text(date),
            ],
          )
        ],
      ),
    );
  }
}

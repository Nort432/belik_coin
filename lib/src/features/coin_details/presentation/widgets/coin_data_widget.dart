import 'package:belik_coin/src/config/app_helpers/build_context_heleper.dart';
import 'package:flutter/material.dart';

class CoinDataWidget extends StatelessWidget {
  const CoinDataWidget({Key? key,
  required this.price,
  required this.date,
  required this.name,
  }) : super(key: key);

  final double price;
  final String date;
  final String name;

  final edgeAll10 = const EdgeInsets.all(10);
  final borderRadius = const BorderRadius.all(Radius.circular(15));

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Container(
      // margin: edgeAll10,
      padding: edgeAll10,
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.blueAccent,width: 2.5),
        // color: Colors.grey,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(locale.symbol),
              Text('$name${locale.usd}'),
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

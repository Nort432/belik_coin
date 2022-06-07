// ignore_for_file: implementation_imports

import 'dart:math';

import 'package:belik_coin/src/config/app_helpers/date_time_helper.dart';
import 'package:belik_coin/src/features/coin_details/domain/entities/price_history_entity.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart' as te;
import 'package:charts_flutter/src/text_style.dart' as ts;
import 'package:intl/intl.dart';

class PriceChartHistoryWidget extends StatelessWidget {
  final List<Series<PriceHistoryEntity, DateTime>> seriesList;
  final bool animate;
  static PriceHistoryEntity? workModel;

  final edgeAll10 = const EdgeInsets.all(10);
  final borderRadius = const BorderRadius.all(Radius.circular(15));

  const PriceChartHistoryWidget(this.seriesList,
      {Key? key, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeAll10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2.5),
        // color: Colors.grey,
        borderRadius: borderRadius,
      ),
      child: TimeSeriesChart(
        seriesList,
        animate: animate,
        dateTimeFactory: const LocalDateTimeFactory(),
        behaviors: [
          LinePointHighlighter(symbolRenderer: CustomCircleSymbolRenderer())
        ],
        selectionModels: [
          SelectionModelConfig(
            changedListener: (SelectionModel model) {
              if (model.hasDatumSelection) {
                workModel = model.selectedDatum.first.datum;
              }
            },
          )
        ],
        primaryMeasureAxis: NumericAxisSpec(
          tickFormatterSpec: BasicNumericTickFormatterSpec.fromNumberFormat(
            NumberFormat.compactSimpleCurrency(),
          ),
        ),
      ),
    );
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  @override
  void paint(
    ChartCanvas canvas,
    Rectangle<num> bounds, {
    List<int>? dashPattern,
    Color? fillColor,
    FillPatternType? fillPattern,
    Color? strokeColor,
    double? strokeWidthPx,
  }) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx,
    );

    canvas.drawRect(
      Rectangle(bounds.left - 5, bounds.top - 30, bounds.width * 9.5,
          bounds.height * 5),
      fill: Color.fromHex(code: '#808080'),
    );

    var currentData = PriceChartHistoryWidget.workModel;
    var textStyle = ts.TextStyle();
    textStyle.color = Color.white;
    textStyle.fontSize = 15;
    canvas.drawText(
        te.TextElement(
          '${currentData?.rateClose.toStringAsFixed(2)}\n${currentData?.timeClose.toDate()}',
          style: textStyle,
        ),
        (bounds.left).round(),
        (bounds.top - 23).round());
  }
}

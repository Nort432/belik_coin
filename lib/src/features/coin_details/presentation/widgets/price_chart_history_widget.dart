
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_style.dart' as style;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/src/text_element.dart' as te;

class PriceChartHistoryWidget extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;
  static String pointerValue = 'null';

  const PriceChartHistoryWidget(this.seriesList,
      {Key? key, required this.animate})
      : super(key: key);

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory PriceChartHistoryWidget.withSampleData() {
    return PriceChartHistoryWidget(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        LinePointHighlighter(
            symbolRenderer: CustomCircleSymbolRenderer()
        )
      ],
      selectionModels: [
        SelectionModelConfig(changedListener: (SelectionModel model) {
          if (model.hasDatumSelection)
            pointerValue = model.selectedSeries[0]
                .measureFn(model.selectedDatum[0].index)
                .toString();
        })
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 5),
      TimeSeriesSales(DateTime(2017, 9, 26), 25),
      TimeSeriesSales(DateTime(2017, 10, 3), 100),
      TimeSeriesSales(DateTime(2017, 10, 10), 75),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int>? dashPattern,
      Color? fillColor,
      FillPatternType? fillPattern,
      Color? strokeColor,
      double? strokeWidthPx}) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx,
    );

    canvas.drawRect(
      Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
          bounds.height + 10),
      fill: Color.transparent,
    );

    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;

    canvas.drawText(
      te.TextElement(PriceChartHistoryWidget.pointerValue, style: textStyle),
      (bounds.left).round(),
      (bounds.top - 28).round(),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

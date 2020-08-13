import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      primaryMeasureAxis:
          new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
      domainAxis: new charts.OrdinalAxisSpec(
        // Make sure that we draw the domain axis line.
        showAxisLine: false,
        // But don't draw anything else.
      ),
      layoutConfig: new charts.LayoutConfig(
          leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
          topMarginSpec: new charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)),
    );
  }
}

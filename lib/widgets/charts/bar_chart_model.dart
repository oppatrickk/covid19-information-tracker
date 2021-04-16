import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String month;
  String day;
  int cases;
  final charts.Color color;

  BarChartModel({
    this.month,
    this.day,
    this.cases,
    this.color,}
      );
}
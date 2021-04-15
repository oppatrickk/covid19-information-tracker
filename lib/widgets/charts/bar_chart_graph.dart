import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19_information_center/widgets/charts/bar_chart_model.dart';

class BarChartGraph extends StatefulWidget {
  final List<BarChartModel> data;

  const BarChartGraph({Key key, this.data}) : super(key: key);

  @override
  _BarChartGraphState createState() => _BarChartGraphState();
}

class _BarChartGraphState extends State<BarChartGraph> {
  List<BarChartModel> _barChartList;

  @override
  void initState() {
    super.initState();
    _barChartList = [
      BarChartModel(month: "Oct"),
      BarChartModel(month: "Nov"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Financial",
          data: widget.data,
          domainFn: (BarChartModel series, _) => series.year,
          measureFn: (BarChartModel series, _) => series.financial,
          colorFn: (BarChartModel series, _) => series.color),
          
    ];

    return _buildFinancialList(series);
  }

  Widget _buildFinancialList(series) {
    return _barChartList != null
        ? ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 5,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height / 3.5,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(child: charts.BarChart(series, animate: true)),
                  ],
                ),
              );
            },
          )
        : SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';

// Widgets
import 'package:covid19_information_center/widgets/cases/nationwide/active_recovered_death.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_model.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_graph.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_provider.dart';

class ConfirmedCases extends StatefulWidget {
  @override
  _ConfirmedCasesState createState() => _ConfirmedCasesState();
}

class _ConfirmedCasesState extends State<ConfirmedCases> {

  var today = DateTime.now();
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  var timeNow = TimeOfDay.now();

  var dateFormat = DateFormat('MMMM dd, yyyy');
  var lineFormat = DateFormat('MM/dd/yy');
  var chartFormat = DateFormat('EE');
  var decimalOne = NumberFormat('#,###,###.0');
  var decimalTwo = NumberFormat('#,###,###.00');
  var numbers = NumberFormat('#,###,###');

  var providerOne;
  var providerTwo;
  var date;
  var dateVaccine;

  var date1;
  var date2;
  var date3;
  var date4;
  var date5;
  var date6;
  var date7;
  var date15;
  var date30;

  var dateFormat2 = DateFormat('M/dd/yy');

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final jhucsse = Provider.of<FetchJhucsseDataProvider>(context);

    double dateNow = timeNow.hour.toDouble() + (timeNow.minute.toDouble() / 60);

    if (worldometer.countries[157].todayCases == 0) {
      providerOne = Provider.of<FetchWorldometerBackupDataProvider>(context);
    } else {
      providerOne = Provider.of<FetchWorldometerDataProvider>(context);
    }

    if (jhucsse.historical[208].caseDay1 == null) {
      providerTwo = Provider.of<FetchJhucsseBackupDataProvider>(context);

      date1 = DateTime.now().subtract(Duration(days: 1));
      date2 = DateTime.now().subtract(Duration(days: 2));
      date3 = DateTime.now().subtract(Duration(days: 3));
      date4 = DateTime.now().subtract(Duration(days: 4));
      date5 = DateTime.now().subtract(Duration(days: 5));
      date6 = DateTime.now().subtract(Duration(days: 6));
      date7 = DateTime.now().subtract(Duration(days: 7));
      date15 = DateTime.now().subtract(Duration(days: 15));
      date30 = DateTime.now().subtract(Duration(days: 30));
    } else {
      providerTwo = Provider.of<FetchJhucsseDataProvider>(context);

      date1 = DateTime.now();
      date2 = DateTime.now().subtract(Duration(days: 1));
      date3 = DateTime.now().subtract(Duration(days: 2));
      date4 = DateTime.now().subtract(Duration(days: 3));
      date5 = DateTime.now().subtract(Duration(days: 4));
      date6 = DateTime.now().subtract(Duration(days: 5));
      date7 = DateTime.now().subtract(Duration(days: 6));
      date15 = DateTime.now().subtract(Duration(days: 14));
      date30 = DateTime.now().subtract(Duration(days: 29));
    }

    if (worldometer.countries[157].todayCases != 0 && dateNow >= 7.0) {
      date = today;
      dateVaccine = yesterday;
    } else {
      date = yesterday;
      dateVaccine = yesterday.subtract(Duration(days: 1));
    }

    double lineDay1 = providerOne.countries[157].cases.toDouble();
    double lineDay2 = providerTwo.historical[208].caseDay1.toDouble();
    double lineDay3 = providerTwo.historical[208].caseDay2.toDouble();
    double lineDay4 = providerTwo.historical[208].caseDay3.toDouble();
    double lineDay5 = providerTwo.historical[208].caseDay4.toDouble();
    double lineDay6 = providerTwo.historical[208].caseDay5.toDouble();
    double lineDay7 = providerTwo.historical[208].caseDay6.toDouble();
    double lineDay8 = providerTwo.historical[208].caseDay7.toDouble();
    double lineDay9 = providerTwo.historical[208].caseDay8.toDouble();
    double lineDay10 = providerTwo.historical[208].caseDay9.toDouble();
    double lineDay11 = providerTwo.historical[208].caseDay10.toDouble();
    double lineDay12 = providerTwo.historical[208].caseDay11.toDouble();
    double lineDay13 = providerTwo.historical[208].caseDay12.toDouble();
    double lineDay14 = providerTwo.historical[208].caseDay13.toDouble();
    double lineDay15 = providerTwo.historical[208].caseDay14.toDouble();
    double lineDay16 = providerTwo.historical[208].caseDay15.toDouble();
    double lineDay17 = providerTwo.historical[208].caseDay16.toDouble();
    double lineDay18 = providerTwo.historical[208].caseDay17.toDouble();
    double lineDay19 = providerTwo.historical[208].caseDay18.toDouble();
    double lineDay20 = providerTwo.historical[208].caseDay19.toDouble();
    double lineDay21 = providerTwo.historical[208].caseDay20.toDouble();
    double lineDay22 = providerTwo.historical[208].caseDay21.toDouble();
    double lineDay23 = providerTwo.historical[208].caseDay22.toDouble();
    double lineDay24 = providerTwo.historical[208].caseDay23.toDouble();
    double lineDay25 = providerTwo.historical[208].caseDay24.toDouble();
    double lineDay26 = providerTwo.historical[208].caseDay25.toDouble();
    double lineDay27 = providerTwo.historical[208].caseDay26.toDouble();
    double lineDay28 = providerTwo.historical[208].caseDay27.toDouble();
    double lineDay29 = providerTwo.historical[208].caseDay28.toDouble();
    double lineDay30 = providerTwo.historical[208].caseDay29.toDouble();


    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 4.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                getTextStyles: (value) => const TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return '${lineFormat.format(date30)}';
                    case 14:
                      return '${lineFormat.format(date15)}';
                    case 29:
                      return '${lineFormat.format(date1)}';
                  }
                  return '';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: false,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '10k';
                    case 3:
                      return '30k';
                    case 30:
                      return '50k';
                  }
                  return '';
                },
                reservedSize: 28,
                margin: 12,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
              ),
            ),
            minX: 0,
            maxX: 29,
            minY: (lineDay30 / 2),
            maxY: lineDay1 * 1,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, lineDay30),
                  FlSpot(1, lineDay29),
                  FlSpot(2, lineDay28),
                  FlSpot(3, lineDay27),
                  FlSpot(4, lineDay26),
                  FlSpot(5, lineDay25),
                  FlSpot(6, lineDay24),
                  FlSpot(7, lineDay23),
                  FlSpot(8, lineDay22),
                  FlSpot(9, lineDay21),
                  FlSpot(10, lineDay20),
                  FlSpot(11, lineDay19),
                  FlSpot(12, lineDay18),
                  FlSpot(13, lineDay17),
                  FlSpot(14, lineDay16),
                  FlSpot(15, lineDay15),
                  FlSpot(16, lineDay14),
                  FlSpot(17, lineDay13),
                  FlSpot(18, lineDay12),
                  FlSpot(19, lineDay11),
                  FlSpot(20, lineDay10),
                  FlSpot(21, lineDay9),
                  FlSpot(22, lineDay8),
                  FlSpot(23, lineDay7),
                  FlSpot(24, lineDay6),
                  FlSpot(25, lineDay5),
                  FlSpot(26, lineDay4),
                  FlSpot(27, lineDay3),
                  FlSpot(28, lineDay2),
                  FlSpot(29, lineDay1),
                ],
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

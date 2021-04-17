import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';

class WeeklyConfirmed extends StatefulWidget {
  @override
  _WeeklyConfirmedState createState() => _WeeklyConfirmedState();
}

class _WeeklyConfirmedState extends State<WeeklyConfirmed> {

  var date1;
  var date15;
  var date30;

  var dateFormat2 = DateFormat('M/dd/yy');

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<FetchFirebaseDataProvider>(context);

    double lineDay1 = firebase.bicol[0].caseTotal.toDouble();
    double lineDay2 = firebase.bicol[1].caseTotal.toDouble();
    double lineDay3 = firebase.bicol[2].caseTotal.toDouble();
    double lineDay4 = firebase.bicol[3].caseTotal.toDouble();
    double lineDay5 = firebase.bicol[4].caseTotal.toDouble();
    double lineDay6 = firebase.bicol[5].caseTotal.toDouble();
    double lineDay7 = firebase.bicol[6].caseTotal.toDouble();
    double lineDay8 = firebase.bicol[7].caseTotal.toDouble();
    double lineDay9 = firebase.bicol[8].caseTotal.toDouble();
    double lineDay10 = firebase.bicol[9].caseTotal.toDouble();
    double lineDay11 = firebase.bicol[10].caseTotal.toDouble();
    double lineDay12 = firebase.bicol[11].caseTotal.toDouble();
    double lineDay13 = firebase.bicol[12].caseTotal.toDouble();
    double lineDay14 = firebase.bicol[13].caseTotal.toDouble();
    double lineDay15 = firebase.bicol[14].caseTotal.toDouble();
    double lineDay16 = firebase.bicol[15].caseTotal.toDouble();
    double lineDay17 = firebase.bicol[16].caseTotal.toDouble();
    double lineDay18 = firebase.bicol[17].caseTotal.toDouble();
    double lineDay19 = firebase.bicol[18].caseTotal.toDouble();
    double lineDay20 = firebase.bicol[19].caseTotal.toDouble();
    double lineDay21 = firebase.bicol[20].caseTotal.toDouble();
    double lineDay22 = firebase.bicol[21].caseTotal.toDouble();
    double lineDay23 = firebase.bicol[22].caseTotal.toDouble();
    double lineDay24 = firebase.bicol[23].caseTotal.toDouble();
    double lineDay25 = firebase.bicol[24].caseTotal.toDouble();
    double lineDay26 = firebase.bicol[25].caseTotal.toDouble();
    double lineDay27 = firebase.bicol[26].caseTotal.toDouble();
    double lineDay28 = firebase.bicol[27].caseTotal.toDouble();
    double lineDay29 = firebase.bicol[28].caseTotal.toDouble();
    double lineDay30 = firebase.bicol[29].caseTotal.toDouble();

    date1 = firebase.bicol[0].date2;
    date15 = firebase.bicol[14].date2;
    date30 = firebase.bicol[29].date2;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 4,
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
                      return '${date30}';
                    case 14:
                      return '${date15}';
                    case 29:
                      return '${date1}';
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
            minY: (lineDay30 / 1.5),
            maxY: lineDay1 * 1.5,
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

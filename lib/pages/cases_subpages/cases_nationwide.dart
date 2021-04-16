import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';

// Widgets
import 'package:covid19_information_center/widgets/cases/nationwide/active_recovered_death.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_model.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_graph.dart';
import 'package:covid19_information_center/widgets/cases/nationwide/confirmed_cases.dart';
import 'package:covid19_information_center/widgets/cases/nationwide/recoveries_death.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_provider.dart';

class Nationwide extends StatefulWidget {
  @override
  _NationwideState createState() => _NationwideState();
}

class _NationwideState extends State<Nationwide> {
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

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final jhucsse = Provider.of<FetchJhucsseDataProvider>(context);
    final vaccine = Provider.of<FetchVaccineDataProvider>(context);

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
    } else {
      providerTwo = Provider.of<FetchJhucsseDataProvider>(context);

      date1 = DateTime.now();
      date2 = DateTime.now().subtract(Duration(days: 1));
      date3 = DateTime.now().subtract(Duration(days: 2));
      date4 = DateTime.now().subtract(Duration(days: 3));
      date5 = DateTime.now().subtract(Duration(days: 4));
      date6 = DateTime.now().subtract(Duration(days: 5));
      date7 = DateTime.now().subtract(Duration(days: 6));
    }

    if (worldometer.countries[157].todayCases != 0 && dateNow >= 7.0) {
      date = today;
      dateVaccine = yesterday;
    } else {
      date = yesterday;
      dateVaccine = yesterday.subtract(Duration(days: 1));
    }

    int barDay1 = (providerTwo.historical[208].caseDay6) -
        (providerTwo.historical[208].caseDay7);
    int barDay2 = (providerTwo.historical[208].caseDay5) -
        (providerTwo.historical[208].caseDay6);
    int barDay3 = (providerTwo.historical[208].caseDay4) -
        (providerTwo.historical[208].caseDay5);
    int barDay4 = (providerTwo.historical[208].caseDay3) -
        (providerTwo.historical[208].caseDay4);
    int barDay5 = (providerTwo.historical[208].caseDay2) -
        (providerTwo.historical[208].caseDay3);
    int barDay6 = (providerTwo.historical[208].caseDay1) -
        (providerTwo.historical[208].caseDay2);
    int barDay7 = providerOne.countries[157].todayCases;

    final List<BarChartModel> data = [
      BarChartModel(
        day: "${chartFormat.format(date7)}",
        cases: barDay1,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date6)}",
        cases: barDay2,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date5)}",
        cases: barDay3,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date4)}",
        cases: barDay4,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date3)}",
        cases: barDay5,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date2)}",
        cases: barDay6,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        day: "${chartFormat.format(date1)}",
        cases: barDay7,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
    ];

    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Nationwide Cases"),
          backgroundColor: kAppBarColor,
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: (Colors.transparent),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Add Refresh here
                    },
                    child: Scrollbar(
                      radius: Radius.circular(20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 50.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 25.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "As of ${dateFormat.format(date)}",
                                        style: TextStyle(
                                          color: kBodyTextColor1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "New Cases",
                                    style: TextStyle(
                                      color: kBodyTextColor2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    numbers.format(providerOne.countries[157].todayCases),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 42.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  BarChartGraph(
                                    data: data,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          RecoveriesDeaths(
                                            number: numbers.format(providerOne.countries[157].todayRecovered),
                                            title: "Recoveries",
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          RecoveriesDeaths(
                                            number: numbers.format(providerOne.countries[157].todayDeaths),
                                            title: "Deaths",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 75.0),
                                    child: Text(
                                      "Total Confirmed Cases",
                                      style: TextStyle(
                                        color: kBodyTextColor2,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Text(
                                      numbers.format(providerOne.countries[157].cases),
                                      style: TextStyle(
                                        color: kBodyTextColor1,
                                        fontSize: 52.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ConfirmedCases(),
                                  // Pie Graph
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 35.0, bottom: 25.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1.5,
                                            child: Row(
                                              children: <Widget>[
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                Expanded(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: PieChart(
                                                      PieChartData(
                                                        pieTouchData: PieTouchData(
                                                            touchCallback: (
                                                                pieTouchResponse) {
                                                              setState(() {
                                                                final desiredTouch = pieTouchResponse
                                                                    .touchInput is! PointerExitEvent &&
                                                                    pieTouchResponse
                                                                        .touchInput is! PointerUpEvent;
                                                                if (desiredTouch &&
                                                                    pieTouchResponse
                                                                        .touchedSection !=
                                                                        null) {
                                                                  touchedIndex =
                                                                      pieTouchResponse
                                                                          .touchedSection
                                                                          .touchedSectionIndex;
                                                                } else {
                                                                  touchedIndex =
                                                                  -1;
                                                                }
                                                              },
                                                              );
                                                            },
                                                        ),
                                                        borderData: FlBorderData(
                                                          show: false,
                                                        ),
                                                        sectionsSpace: 0,
                                                        centerSpaceRadius: 40,
                                                        sections: List.generate(
                                                          3, (i) {
                                                          final isTouched = i == touchedIndex;
                                                          final double fontSize = isTouched ? 25 : 16;
                                                          final double radius = isTouched ? 60 : 50;
                                                          switch (i) {
                                                            case 0:
                                                              return PieChartSectionData(
                                                                color: kPieColor1,
                                                                value: providerOne.countries[157].percentageActive,
                                                                title: '${decimalOne.format(providerOne.countries[157].percentageActive)}%',
                                                                radius: radius,
                                                                titleStyle: TextStyle(
                                                                    fontSize: fontSize,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: const Color(0xffffffff)),
                                                              );
                                                            case 1:
                                                              return PieChartSectionData(
                                                                color: kPieColor2,
                                                                value: providerOne.countries[157].percentageRecovered,
                                                                title: '${decimalOne.format(providerOne.countries[157].percentageRecovered)}%',
                                                                radius: radius,
                                                                titleStyle: TextStyle(
                                                                    fontSize: fontSize,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: const Color(0xffffffff)),
                                                              );
                                                            case 2:
                                                              return PieChartSectionData(
                                                                color: kPieColor3,
                                                                value: providerOne.countries[157].percentageDeaths,
                                                                title: '${decimalOne.format(providerOne.countries[157].percentageDeaths)}%',
                                                                radius: radius,
                                                                titleStyle: TextStyle(
                                                                    fontSize: fontSize,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: const Color(0xffffffff)),
                                                              );
                                                            default:
                                                              return null;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                ActiveRecoveredDeath(
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    size: 30.0,
                                                    color: kPieColor1,
                                                  ),
                                                  number: Text(
                                                    numbers.format(providerOne.countries[157].active),
                                                    style: TextStyle(
                                                      color: kBodyTextColor1,
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    "Active Cases",
                                                    style: TextStyle(
                                                      color: kAppBarColor,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.blue.withOpacity(0.2),
                                                  width: 1.0,
                                                  height: 75,
                                                ),
                                                ActiveRecoveredDeath(
                                                  icon: Icon(
                                                    Icons.check_circle,
                                                    size: 30.0,
                                                    color: kPieColor2,
                                                  ),
                                                  number: Text(
                                                    numbers.format(providerOne.countries[157].recovered),
                                                    style: TextStyle(
                                                      color: kBodyTextColor1,
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    "Recovered",
                                                    style: TextStyle(
                                                      color: kAppBarColor,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.blue.withOpacity(0.2),
                                                  width: 1.0,
                                                  height: 75,
                                                ),
                                                ActiveRecoveredDeath(
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    size: 30.0,
                                                    color: kPieColor3,
                                                  ),
                                                  number: Text(
                                                    numbers.format(providerOne.countries[157].deaths),
                                                    style: TextStyle(
                                                      color: kBodyTextColor1,
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    "Deaths",
                                                    style: TextStyle(
                                                      color: kAppBarColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      "Total Vaccine Administered (per doses)",
                                      style: TextStyle(
                                        color: kBodyTextColor2,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${numbers.format(
                                            vaccine.vaccine[122].administered)}",
                                        style: TextStyle(
                                          color: kBodyTextColor1,
                                          fontSize: 42.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "*",
                                        style: TextStyle(
                                          color:
                                          Colors.redAccent.withOpacity(0.8),
                                          fontSize: 36.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "* As of ${dateFormat.format(dateVaccine)}",
                                    style: TextStyle(
                                      color: Colors.redAccent.withOpacity(0.8),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                      numbers.format(
                                          providerOne.countries[157].population)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

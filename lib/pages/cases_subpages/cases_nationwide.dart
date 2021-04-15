import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// Widgets
import 'package:covid19_information_center/widgets/active_recovered_death.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_model.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_graph.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';

class Nationwide extends StatefulWidget {
  @override
  _NationwideState createState() => _NationwideState();
}

class _NationwideState extends State<Nationwide> {
  var today = DateTime.now();
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  var timeNow = TimeOfDay.now();

  var dateFormat = DateFormat('MMMM dd, yyyy');
  var chartFormat = DateFormat('EE');
  var decimalOne = NumberFormat('#,###,###.0');
  var decimalTwo = NumberFormat('#,###,###.00');
  var numbers = NumberFormat('#,###,###');

  var provider;
  var date;
  var dateVaccine;

  var date1 = DateTime.now().subtract(Duration(days: 6));
  var date2 = DateTime.now().subtract(Duration(days: 5));
  var date3 = DateTime.now().subtract(Duration(days: 4));
  var date4 = DateTime.now().subtract(Duration(days: 3));
  var date5 = DateTime.now().subtract(Duration(days: 2));
  var date6 = DateTime.now().subtract(Duration(days: 1));
  var date7 = DateTime.now();

  var dateFormat2 = DateFormat('M/dd/yy');

  @override
  Widget build(BuildContext context) {

    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final jhucsse = Provider.of<FetchJhucsseDataProvider>(context);
    final vaccine = Provider.of<FetchVaccineDataProvider>(context);

    double dateNow = timeNow.hour.toDouble() + (timeNow.minute.toDouble() / 60);

    if (worldometer.countries[157].todayCases == 0) {
      provider = Provider.of<FetchBackupDataProvider>(context);
    } else {
      provider = Provider.of<FetchWorldometerDataProvider>(context);
    }

    if (worldometer.countries[157].todayCases != 0 && dateNow >= 7.0) {
      date = today;
      dateVaccine = yesterday;

      date1 = DateTime.now().subtract(Duration(days: 6));
      date2 = DateTime.now().subtract(Duration(days: 5));
      date3 = DateTime.now().subtract(Duration(days: 4));
      date4 = DateTime.now().subtract(Duration(days: 3));
      date5 = DateTime.now().subtract(Duration(days: 2));
      date6 = DateTime.now().subtract(Duration(days: 1));
      date7 = DateTime.now();

    } else {
      date = yesterday;
      dateVaccine = yesterday.subtract(Duration(days: 1));

      date1 = DateTime.now().subtract(Duration(days: 7));
      date2 = DateTime.now().subtract(Duration(days: 6));
      date3 = DateTime.now().subtract(Duration(days: 5));
      date4 = DateTime.now().subtract(Duration(days: 4));
      date5 = DateTime.now().subtract(Duration(days: 3));
      date6 = DateTime.now().subtract(Duration(days: 2));
      date7 = DateTime.now().subtract(Duration(days: 1));

    }

    int day1 = (jhucsse.historical[208].day2) - (jhucsse.historical[208].day1);
    int day2 = (jhucsse.historical[208].day3) - (jhucsse.historical[208].day2);
    int day3 = (jhucsse.historical[208].day4) - (jhucsse.historical[208].day3);
    int day4 = (jhucsse.historical[208].day5) - (jhucsse.historical[208].day4);
    int day5 = (jhucsse.historical[208].day6) - (jhucsse.historical[208].day5);
    int day6 = (provider.countries[157].cases) - (jhucsse.historical[208].day6);
    int day7 = provider.countries[157].todayCases;

    final List<BarChartModel> data = [
      BarChartModel(
        year: "${chartFormat.format(date1)}",
        financial: day1,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date2)}",
        financial: day2,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date3)}",
        financial: day3,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date4)}",
        financial: day4,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date5)}",
        financial: day5,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date6)}",
        financial: day6,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        year: "${chartFormat.format(date7)}",
        financial: day7,
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                                  ),
                                ),
                                Text(
                                  numbers.format(
                                      provider.countries[157].todayCases),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                BarChartGraph(
                                  data: data,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    "Total Confirmed Cases",
                                    style: TextStyle(
                                      color: kBodyTextColor2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  numbers.format(provider.countries[157].cases),
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 42.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10.0),
                                  child: Container(
                                    height: 6.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: provider.countries[157]
                                                  .percentageActive *
                                              3,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          width: provider.countries[157]
                                                  .percentageRecovered *
                                              3,
                                        ),
                                        Container(
                                          color: Colors.red,
                                          width: provider.countries[157]
                                                  .percentageDeaths *
                                              3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 25.0),
                                  child: Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ActiveRecoveredDeath(
                                          icon: Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.orange,
                                          ),
                                          number: Text(
                                            numbers.format(
                                                provider.countries[157].active),
                                            style: TextStyle(
                                              color: kBodyTextColor1,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          title: Text(
                                            "Active Cases",
                                            style: TextStyle(
                                              color: kBodyTextColor2,
                                            ),
                                          ),
                                        ),
                                        ActiveRecoveredDeath(
                                          icon: Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.green,
                                          ),
                                          number: Text(
                                            numbers.format(provider
                                                .countries[157].recovered),
                                            style: TextStyle(
                                              color: kBodyTextColor1,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          title: Text(
                                            "Recovered",
                                            style: TextStyle(
                                              color: kBodyTextColor2,
                                            ),
                                          ),
                                        ),
                                        ActiveRecoveredDeath(
                                          icon: Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.red,
                                          ),
                                          number: Text(
                                            numbers.format(
                                                provider.countries[157].deaths),
                                            style: TextStyle(
                                              color: kBodyTextColor1,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          title: Text(
                                            "Deaths",
                                            style: TextStyle(
                                              color: kBodyTextColor2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: Text(
                                    "Total Vaccine Administered",
                                    style: TextStyle(
                                      color: kBodyTextColor2,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  "(As of ${dateFormat.format(dateVaccine)})",
                                  style: TextStyle(
                                    color: kBodyTextColor2,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  numbers.format(
                                      vaccine.vaccine[122].administered),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
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
          ],
        ),
      ),
    );
  }
}
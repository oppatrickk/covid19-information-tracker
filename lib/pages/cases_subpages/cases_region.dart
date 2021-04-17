import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';

// Widgets
import 'package:covid19_information_center/widgets/cases/nationwide/active_recovered_death.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_model.dart';
import 'package:covid19_information_center/widgets/charts/bar_chart_graph.dart';

import 'package:covid19_information_center/widgets/cases/region/weekly_confirmed.dart';
import 'package:covid19_information_center/widgets/cases/nationwide/recoveries_death.dart';
import 'package:covid19_information_center/widgets/cases/region/laboratories.dart';

import 'package:covid19_information_center/widgets/cases/region/albay.dart';
import 'package:covid19_information_center/widgets/cases/region/location.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';

class Region extends StatefulWidget {
  @override
  _RegionState createState() => _RegionState();
}

class _RegionState extends State<Region> {

  var decimalOne = NumberFormat('#,###,###.0');
  var decimalTwo = NumberFormat('#,###,###.00');
  var numbers = NumberFormat('#,###,###');

  int touchedIndex;
  String _chosenValue;

  var percentageActive;
  var percentageRecovered;
  var percentageDeaths;

  /*
  Widget NewCases() {

    switch (_chosenValue)
    {
      case "Albay":
        return Albay();
      case "Masbate":
        return AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.fastOutSlowIn,
          child: Text(
              "Masbate\n h\n h \n \n n \n s"
          ),
        );
    }
  }

   */

    @override
  Widget build(BuildContext context) {

    final firebase = Provider.of<FetchFirebaseDataProvider>(context);

    int barDay1 = firebase.bicol[0].caseToday;
    int barDay2 = firebase.bicol[1].caseToday;
    int barDay3 = firebase.bicol[2].caseToday;
    int barDay4 = firebase.bicol[3].caseToday;
    int barDay5 = firebase.bicol[4].caseToday;
    int barDay6 = firebase.bicol[5].caseToday;
    int barDay7 = firebase.bicol[6].caseToday;

    percentageActive = (firebase.bicol[0].caseActive / firebase.bicol[0].caseTotal) * 100;
    percentageRecovered = (firebase.bicol[0].recoveriesTotal / firebase.bicol[0].caseTotal) * 100;
    percentageDeaths = (firebase.bicol[0]. deathsTotal / firebase.bicol[0].caseTotal) * 100;

    final List<BarChartModel> data = [
      BarChartModel(
        day: "${firebase.bicol[6].day}",
        cases: barDay7,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[5].day}",
        cases: barDay6,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[4].day}",
        cases: barDay5,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[3].day}",
        cases: barDay4,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[2].day}",
        cases: barDay3,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[1].day}",
        cases: barDay2,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        day: "${firebase.bicol[0].day}",
        cases: barDay1,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    Future <void> _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 3000));
      Provider.of<FetchWorldometerDataProvider>(context, listen: false).initialize();
      Provider.of<FetchWorldometerBackupDataProvider>(context, listen: false).initialize();
      Provider.of<FetchJhucsseDataProvider>(context, listen: false).initialize();
      Provider.of<FetchJhucsseBackupDataProvider>(context, listen: false).initialize();
      Provider.of<FetchFirebaseDataProvider>(context, listen: false).initialize();

      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingData()),);
    }

    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Bicol Region Cases"),
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
                  padding: const EdgeInsets.only(top: 2.0),
                  child: RefreshIndicator(
                      onRefresh: () => _onRefresh(),
                    child: Scrollbar(
                      radius: Radius.circular(20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40.0, left: 30.0, right: 30.0, bottom: 75.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "As of ${firebase.bicol[0].date1}",
                                        style: TextStyle(
                                          color: kBodyTextColor1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Update No. ${firebase.bicol[0].caseNo}",
                                        style: TextStyle(
                                          color: kBodyTextColor2,
                                          fontSize: 14.0,
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
                                    numbers.format(firebase.bicol[0].caseToday),
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 48.0,
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
                                            number: numbers.format(firebase.bicol[0].recoveriesToday),
                                            title: "Recoveries",
                                            color: Colors.blueAccent.withOpacity(0.15),
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          RecoveriesDeaths(
                                            number: numbers.format(firebase.bicol[0].deathsToday),
                                            title: "Deaths",
                                            color: Colors.blueAccent.withOpacity(0.15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
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
                                      numbers.format(firebase.bicol[0].caseTotal),
                                      style: TextStyle(
                                        color: kBodyTextColor1,
                                        fontSize: 52.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  WeeklyConfirmed(),
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
                                                                value: percentageActive,
                                                                title: '${decimalOne.format(percentageActive)}%', // '${decimalOne.format(providerOne.countries[157].percentageActive)}%',
                                                                radius: radius,
                                                                titleStyle: TextStyle(
                                                                    fontSize: fontSize,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: const Color(0xffffffff)),
                                                              );
                                                            case 1:
                                                              return PieChartSectionData(
                                                                color: kPieColor2,
                                                                value: percentageRecovered,
                                                                title: '${decimalOne.format(percentageRecovered)}%',
                                                                radius: radius,
                                                                titleStyle: TextStyle(
                                                                    fontSize: fontSize,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: const Color(0xffffffff)),
                                                              );
                                                            case 2:
                                                              return PieChartSectionData(
                                                                color: kPieColor3,
                                                                value: percentageDeaths,
                                                                title: '${decimalOne.format(percentageDeaths)}%',
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
                                                    numbers.format(firebase.bicol[0].caseActive),
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
                                                    numbers.format(firebase.bicol[0].recoveriesTotal),
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
                                                    numbers.format(firebase.bicol[0].deathsTotal),
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
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                                    child: Text(
                                      "Distribution of New Cases",
                                      style: TextStyle(
                                        color: kBodyTextColor2,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Location(title: "Albay: ", number: "${firebase.bicol[0].activeALBAY}"),
                                  SizedBox(height: 20.0),
                                  Location(title: "Camarines Norte: ", number: "${firebase.bicol[0].activeCAMNORTE}"),
                                  SizedBox(height: 20.0),
                                  Location(title: "Camarines Sur: ", number: "${firebase.bicol[0].activeCAMSUR}"),
                                  SizedBox(height: 20.0),
                                  Location(title: "Catanduanes: ", number: "${firebase.bicol[0].activeCATANDUANES}"),
                                  SizedBox(height: 20.0),
                                  Location(title: "Masbate: ", number: "${firebase.bicol[0].activeMASBATE}"),
                                  SizedBox(height: 20.0),
                                  Location(title: "Sorsogon: ", number: "${firebase.bicol[0].activeSORSOGON}"),
                                  SizedBox(height: 20.0),
                                  /*
                                  Container(
                                    padding: EdgeInsets.only(left: 30.0, right: 15.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: Color(0xFFE9EFFD),
                                        ),
                                        child: DropdownButton<String>(
                                          focusColor:Colors.white,
                                          value: _chosenValue,
                                          //elevation: 5,
                                          style: TextStyle(color: Colors.white),
                                          iconEnabledColor:Colors.black,
                                          items: <String>[
                                            'Albay',
                                            'Camarines Norte',
                                            'Camarines Sur',
                                            'Catanduanes',
                                            'Masbate',
                                            'Sorsogon',
                                          ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value,style:TextStyle(color:Colors.black),),
                                            );
                                          }).toList(),
                                          hint:Text("Select Province",
                                            style: TextStyle(
                                                color: kBodyTextColor2,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              _chosenValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  NewCases(),

                                   */
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      "Test Results Received",
                                      style: TextStyle(
                                        color: kBodyTextColor2,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${numbers.format(firebase.bicol[0].testsTotal)}",
                                    style: TextStyle(
                                      color: kBodyTextColor1,
                                      fontSize: 42.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                                    child: Text(
                                      "Reporting Laboratories",
                                      style: TextStyle(
                                        color: kBodyTextColor2,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Laboratories(
                                              number: "${numbers.format(firebase.bicol[0].testsBRDL)}",
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Text(
                                                "BRDRL\nReg.5",
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Laboratories(
                                              number: "${numbers.format(firebase.bicol[0].testsBMC)}",
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Text(
                                              "BMC \nReg.5",
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Laboratories(
                                                number: "${numbers.format(firebase.bicol[0].testsMetro)}",
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Text(
                                                "Metro Health\nSpecialists \nInc., Reg.5",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Laboratories(
                                                number: "${numbers.format(firebase.bicol[0].testsOthers)}",
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Text(
                                                "Other/Private\nLabs",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
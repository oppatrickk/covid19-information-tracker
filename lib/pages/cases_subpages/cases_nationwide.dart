import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

// Widgets
import 'package:covid19_information_center/widgets/active_recovered_death.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';


class Nationwide extends StatefulWidget {

  @override
  _NationwideState createState() => _NationwideState();
}

class _NationwideState extends State<Nationwide> {

  var decimalOne = NumberFormat('#,###,###.0');
  var decimalTwo = NumberFormat('#,###,###.00');
  var numbers = NumberFormat('#,###,###');

  @override
  Widget build(BuildContext context) {

    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final jhucsse = Provider.of<FetchJhucsseDataProvider>(context);

    var provider;

    if (worldometer.countries[157].todayCases == 0)
    {
      provider = Provider.of<FetchBackupDataProvider>(context);
    }
    else
    {
      provider = Provider.of<FetchWorldometerDataProvider>(context);
    }

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
              height: MediaQuery.of(context).size.height - 82.0,
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
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Total Confirmed Cases",
                                    style: TextStyle(
                                      color: kBodyTextColor2,
                                    ),
                                ),
                                Text(
                                  numbers.format(provider.countries[157].cases),
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 48.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                                  child: Container(
                                    height: 6.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: provider.countries[157].percentageActive * 3,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          width: provider.countries[157].percentageRecovered * 3,
                                        ),
                                        Container(
                                          color: Colors.red,
                                          width: provider.countries[157].percentageDeaths * 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 25.0),
                                  child: Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ActiveRecoveredDeath(
                                          icon: Icon(Icons.radio_button_checked, color: Colors.orange,),
                                          number: Text(numbers.format(provider.countries[157].active),
                                            style: TextStyle(
                                              color: kBodyTextColor1,
                                              fontSize: 20.0,
                                          ),
                                        ),
                                          title: Text("Active Cases",
                                            style: TextStyle(
                                              color: kBodyTextColor2,
                                            ),
                                          ),
                                        ),
                                        ActiveRecoveredDeath(
                                          icon: Icon(Icons.radio_button_checked, color: Colors.green,),
                                            number: Text(numbers.format(provider.countries[157].recovered),
                                              style: TextStyle(
                                                color: kBodyTextColor1,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            title: Text("Recovered",
                                            style: TextStyle(
                                              color: kBodyTextColor2,
                                              ),
                                            ),
                                        ),
                                        ActiveRecoveredDeath(
                                          icon: Icon(Icons.radio_button_checked, color: Colors.red,),
                                            number: Text(numbers.format(provider.countries[157].deaths),
                                              style: TextStyle(
                                                color: kBodyTextColor1,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            title: Text("Deaths",
                                              style: TextStyle(
                                                color: kBodyTextColor2,
                                              ),
                                            ),
                                        ),
                                      ],
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
                                  numbers.format(provider.countries[157].todayCases),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: 2.0,
                                  child: BarChart(
                                    BarChartData(
                                      barGroups: getBarGroups(),
                                      borderData: FlBorderData(show: false),
                                      titlesData: FlTitlesData(
                                        leftTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTitles: getWeek,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "1"
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

getBarGroups() {
  List<double> barChartDatas = [11020, 8344, 9363, 6400, 9179, 12206, 12674];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: value,
            //This is not the proper way, this is just for demo
            colors: [Colors.red],
            width: 16,
          )
        ],
      ),
    ),
  );
  return barChartGroups;
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return '04/04';
    case 1:
      return '04/05';
    case 2:
      return '04/06';
    case 3:
      return '04/07';
    case 4:
      return '04/08';
    case 5:
      return '04/09';
    case 6:
      return '04/10';
    default:
      return '';
  }
}
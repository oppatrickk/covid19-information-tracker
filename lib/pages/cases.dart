import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:covid19_information_center/pages/cases_subpages/cases_region.dart';
import 'package:covid19_information_center/pages/cases_subpages/cases_nationwide.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';
import 'package:covid19_information_center/database/initialize_data.dart';


// Widgets
import 'package:covid19_information_center/widgets/cases/case_card.dart';

class CaseSum extends StatefulWidget {

  @override
  _CaseSumState createState() => _CaseSumState();
}

class _CaseSumState extends State<CaseSum> {

  var today = DateTime.now();
  var yesterday = DateTime.now().subtract(Duration(days:1));
  var timeNow = TimeOfDay.now();

  var dateFormat = DateFormat('MMMM dd, yyyy');
  var decimalOne = NumberFormat('#,###,###.0');
  var decimalTwo = NumberFormat('#,###,###.00');
  var numbers = NumberFormat('#,###,###');

  var provider;
  var date;

  @override
  Widget build(BuildContext context) {

    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final firebase = Provider.of<FetchFirebaseDataProvider>(context);

    double dateNow = timeNow.hour.toDouble() + (timeNow.minute.toDouble() / 60);

    if (worldometer.countries[157].todayCases == 0) {
      provider = Provider.of<FetchBackupDataProvider>(context);
    }
    else {
      provider = Provider.of<FetchWorldometerDataProvider>(context);
    }

    if (worldometer.countries[157].todayCases != 0 && dateNow >= 7.0) {
        date = today;
    }
    else {
        date = yesterday;
    }

    Future <void> _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 3000));
      Provider.of<FetchWorldometerDataProvider>(context, listen: false).initialize();
      Provider.of<FetchJhucsseDataProvider>(context, listen: false).initialize();
      Provider.of<FetchFirebaseDataProvider>(context, listen: false).initialize();

      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingData()),);
    }

    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width),
            ),
            RefreshIndicator(
              onRefresh: () => _onRefresh(),
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.purple
                    ],
                    stops: [
                      0.0,
                      0.1,
                      0.9,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 30, right: 30.0),
                        child: Column(
                          children: [
                            CaseCard(
                              title: "Nationwide Cases",
                              date: "As of ${dateFormat.format(date)} | 4PM",
                              totalCases: numbers.format(provider.countries[157].cases),
                              newCases: numbers.format(provider.countries[157].todayCases),
                              page: Nationwide(),
                            ),
                            CaseCard(
                              title: "Bicol Region Cases",
                              date: "As of ${firebase.bicol[0].date}",
                              totalCases: numbers.format(firebase.bicol[0].caseTotal),
                              newCases: numbers.format(firebase.bicol[0].caseToday),
                              page: Region(),
                            ),
                          ],
                        ),
                      );
                    },
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
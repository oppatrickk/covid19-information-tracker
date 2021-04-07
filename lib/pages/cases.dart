import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Pages
import 'package:covid19_information_center/pages/cases_subpages/cases_region.dart';

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';

class CaseSum extends StatefulWidget {
  @override
  _CaseSumState createState() => _CaseSumState();
}

class _CaseSumState extends State<CaseSum> {
  final _db =
      FirebaseDatabase.instance.reference().child("sheets").child("Daily");

  var totalCases;
  var activeCases;
  var recoveries;
  var deaths;
  var date;

  var numFormatter = NumberFormat('#,###,###');

  fetchFirebase() async {
    await Future.delayed(Duration(seconds: 1));
    await _db.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((k, v) {
        setState(() {
          totalCases = v["total_cases"];
          activeCases = v["active_cases"];
          recoveries = v["recoveries"];
          deaths = v["deaths"];
          date = v["date"];
        });
      });
    });
  }

  @override
  void initState() {
    fetchFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),
            ),
            RefreshIndicator(
              onRefresh: () async {
                return await _db.once().then((DataSnapshot snapshot) {
                  print(snapshot.value);
                  Map<dynamic, dynamic> values = snapshot.value;
                  values.forEach((k, v) {
                    setState(() {
                      totalCases = v["total_cases"];
                      activeCases = v["active_cases"];
                      recoveries = v["recoveries"];
                      deaths = v["deaths"];
                      date = v["date"];
                    });
                  });
                });
              },
              child: ListView(
                children: [
                  if (totalCases == null)
                    Container(
                        padding: EdgeInsets.only(top: 250),
                        child: Center(
                          child: Column(
                            children: [
                              GlowingProgressIndicator(
                                child: HeartbeatProgressIndicator(
                                  child: FaIcon(FontAwesomeIcons.shieldVirus,
                                      color: Colors.blueAccent),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Loading Data",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ))
                  else
                    Column(
                      children: [
                        Container(
                          /*Nationwide Cases */
                          padding: EdgeInsets.only(
                              left: 30, top: 40, right: 30, bottom: 20),
                          width: double.infinity,
                          height: 300,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Wrap(
                              runSpacing: 15,
                              spacing: 20,
                              children: <Widget>[
                                Text(
                                  "Nationwide Cases",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "As of April 2 | 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          /*Region V Cases */
                          padding: EdgeInsets.only(
                              left: 30, top: 10, right: 30, bottom: 20),
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Wrap(
                              runSpacing: 15,
                              spacing: 20,
                              children: <Widget>[
                                Text(
                                  "Bicol (Region V) Cases",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "As of April 2 | 4:00 PM",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Region()),
                                          );
                                        },
                                        child: Text("Read More"),
                                    )],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

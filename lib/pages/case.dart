import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';


class CaseSum extends StatefulWidget {
  @override
  _CaseSumState createState() => _CaseSumState();
}

class _CaseSumState extends State<CaseSum> {
  final _db=FirebaseDatabase.instance.reference().child("sheets").child("Daily");

  var totalCases;
  var activeCases;
  var recoveries;
  var deaths;
  var date;

  var numFormatter = NumberFormat('#,###,###');

  fetchFirebase() async {
    await Future.delayed(Duration(seconds: 1));
    await _db.once().then((DataSnapshot snapshot){
      print(snapshot.value);
      Map<dynamic, dynamic> values=snapshot.value;
      if (values != null){
        values.forEach((k,v) {
          setState(() {
            totalCases = v["total_cases"];
            activeCases = v["active_cases"];
            recoveries = v["recoveries"];
            deaths = v["deaths"];
            date = v["date"];
          });
        });
      }
    });
  }

  @override
  void initState() {
    fetchFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: totalCases == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: <Widget>[
          Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    // child: SvgPicture.asset("assets/icons/menu.svg"), Add Icon here later
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 25,
                            left: 30,
                            child: Text(
                              "Case Summary",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                  )
                ],
              )
          ),
          Container(
              padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.10),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("As of $date"),
                    ],
                  ),
                  InfoCard(
                    effectedWidth: 150,
                    title: "Total Cases",
                    effectedNum: numFormatter.format(totalCases),
                  ),
                  InfoCard(
                    effectedWidth: 150,
                    title: "Active Cases",
                    effectedNum: numFormatter.format(activeCases),
                  ),
                  InfoCard(
                    effectedWidth: 150,
                    title: "Recoveries",
                    effectedNum: numFormatter.format(recoveries),
                  ),
                  InfoCard(
                    effectedWidth: 150,
                    title: "Deaths",
                    effectedNum: numFormatter.format(deaths),
                  ),
                ],
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed:(){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/case");
                      },
                      child: Text("Refresh"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

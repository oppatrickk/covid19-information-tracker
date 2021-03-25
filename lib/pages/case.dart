import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';
import 'package:covid19_information_center/widgets/app_bar.dart';


class CaseSum extends StatefulWidget {
  @override
  _CaseSumState createState() => _CaseSumState();
}

class _CaseSumState extends State<CaseSum> {
  final databaseReference = FirebaseDatabase.instance.reference();

  var totalCases;
  var activeCases;


  @override
  Widget build(BuildContext context) {
    final _db=FirebaseDatabase.instance.reference().child("sheets").child("Daily");

    _db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values=snapshot.value;
      print(values.toString());
      if (values != null){
        values.forEach((k,v) {
          print(k);
          totalCases = v["total_cases"];
          activeCases = v["active_cases"];
        });
      }
    });

    return Scaffold(
      bottomNavigationBar:
        BaseAppBar(),
      body: Column(
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
                      SizedBox(
                        width: 100,
                      ),
                      Text("As of March 04, 2021"),
                    ],
                  ),
                  InfoCard(
                    title: "Total Cases",
                    effectedNum: totalCases,
                  ),
                  InfoCard(
                    title: "Active Cases",
                    effectedNum: activeCases,
                  ),
                  InfoCard(
                    title: "Recoveries",
                    effectedNum: 4216,
                  ),
                  InfoCard(
                    title: "Death",
                    effectedNum: 213,
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
                        _db.once().then((DataSnapshot snapshot){
                          Map<dynamic, dynamic> values=snapshot.value;
                          print(values.toString());
                          if (values != null){
                            values.forEach((k,v) {
                              print(k);
                              print(v["date"]);
                              print(v["total_cases"]);
                              totalCases = v["total_cases"];

                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/case");

                            });
                          }
                        });

                      },
                      child: Text("Retrieve Data"),
                    ),
                    Text(""),
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

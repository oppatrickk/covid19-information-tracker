import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

// Pages
import 'package:covid19_information_center/pages/cases_subpages/cases_region.dart';
import 'package:covid19_information_center/pages/cases_subpages/cases_nationwide.dart';

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';

class CaseSum extends StatefulWidget {
  @override
  _CaseSumState createState() => _CaseSumState();
}

class _CaseSumState extends State<CaseSum> {
  var numFormatter = NumberFormat('#,###,###');

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
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width),
            ),
            RefreshIndicator(
              onRefresh: () async {},
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                    stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            /*Nationwide Cases */
                            padding: EdgeInsets.only(
                                left: 30, top: 10, right: 30, bottom: 20),
                            width: double.infinity,
                            height: 200,
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
                                    "Nationwide Cases",
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
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Nationwide()),
                                          );
                                        },
                                        child: Text("Read More"),
                                      )
                                    ],
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
                            height: 200,
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
                                    "Bicol Region Cases",
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
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Region()),
                                          );
                                        },
                                        child: Text("Read More"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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

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
import 'package:provider/provider.dart';

// Pages
import 'package:covid19_information_center/pages/cases_subpages/cases_region.dart';
import 'package:covid19_information_center/pages/cases_subpages/cases_nationwide.dart';

// Database
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_service.dart';

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
    final provider = Provider.of<FetchDataProvider>(context);

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
                      return Column(
                        children: [
                          Container(
                            /*Nationwide Cases */
                            padding: EdgeInsets.only(
                                left: 30, top: 10, right: 30, bottom: 20),
                            width: double.infinity,
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
                                runSpacing: 5,
                                spacing: 20,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        "Nationwide Cases",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "As of April 10, 2021 | 4 PM",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Confirmed Cases",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        numFormatter.format(
                                            provider.randomJson[157].cases),
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "+",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Text(
                                        numFormatter.format(
                                            provider.randomJson[157].todayCases),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Text(
                                        " Newly Reported Cases",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Nationwide()),
                                            );
                                          },
                                          child: Text(
                                              "Read More",
                                              style: TextStyle(
                                              ),
                                          ),
                                        ),
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
                                runSpacing: 5,
                                spacing: 20,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        "Bicol Region Cases",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "As of April 9, 2021 | 4 PM",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Cases",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "5,854",
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "+",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Text(
                                        "65",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Text(
                                        " Newly Reported Cases",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Region()),
                                            );
                                          },
                                          child: Text(
                                            "Read More",
                                            style: TextStyle(

                                            ),
                                          ),
                                        ),
                                      )
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

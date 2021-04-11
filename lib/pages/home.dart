import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/end_drawer.dart';
import 'package:covid19_information_center/widgets/mask_hugas_iwas.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var formatter1 = NumberFormat('#,###,###');
    var formatter2 = NumberFormat('#,###,###.0');

    final provider = Provider.of<FetchDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            color: kAppBarColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "COVID-19 | PHILIPPINES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "INFORMATION CENTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Text(
                      "Total Confirmed Cases",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kBodyTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      formatter1.format(provider.randomJson[157].cases),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: kBodyTextColor1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "+",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text(
                            formatter1
                                .format(provider.randomJson[157].todayCases),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text(
                            " added on 04/10/21",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 15,
                              width:
                                  provider.randomJson[157].percentageActive * 3,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                    bottomLeft: Radius.circular(45)),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  formatter2.format(provider
                                      .randomJson[157].percentageActive),
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text("Active",
                              style: TextStyle(
                                color: kBodyTextColor2,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 15,
                              width:
                                  provider.randomJson[157].percentageRecovered *
                                      3,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(45),
                                    bottomRight: Radius.circular(45)),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  formatter2.format(provider
                                      .randomJson[157].percentageRecovered),
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    color: kBodyTextColor1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text("Recovered",
                              style: TextStyle(
                              color: kBodyTextColor2,
                              fontSize: 12.0,
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaskHugasIwas(
                          icon: FaIcon(FontAwesomeIcons.headSideMask,
                              color: Colors.white),
                          title1: Text(
                            "WEAR",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title2: Text(
                            "MASK",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: kAppBarColor.withOpacity(0.9),
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                        ),
                        MaskHugasIwas(
                          icon: FaIcon(FontAwesomeIcons.handsWash,
                              color: Colors.black),
                          title1: Text(
                            "WASH",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title2: Text(
                            "HANDS",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.black.withOpacity(0.04),
                        ),
                        MaskHugasIwas(
                          icon: FaIcon(FontAwesomeIcons.peopleArrows,
                              color: Colors.white),
                          title1: Text(
                            "KEEP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title2: Text(
                            "DISTANCE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Color(0xFFCE2317).withOpacity(0.9),
                          radius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

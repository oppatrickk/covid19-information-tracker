import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';

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
    var formatter = NumberFormat('#,###,000');

    final provider = Provider.of<FetchDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: kAppBarColor,
      ),
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Container(
                padding:
                    EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.10),
                ),
                child: Wrap(
                  runSpacing: 15,
                  spacing: 20,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
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
                    Text(
                      "As of April 2 | 4:00 PM",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    InfoCard(
                      title: "Total Cases",
                      effectedNum:
                          formatter.format(provider.randomJson[157].cases),
                    ),
                    InfoCard(
                      effectedWidth: 155,
                      title: "New Cases",
                      effectedNum:
                          formatter.format(provider.randomJson[157].todayCases),
                    ),
                    InfoCard(
                      effectedWidth: 155,
                      title: "Active Cases",
                      effectedNum:
                          formatter.format(provider.randomJson[157].active),
                    ),
                    InfoCard(
                      effectedWidth: 155,
                      title: "Total Recoveries",
                      effectedNum:
                          formatter.format(provider.randomJson[157].recovered),
                    ),
                    InfoCard(
                      effectedWidth: 155,
                      title: "Total Deaths",
                      effectedNum:
                          formatter.format(provider.randomJson[157].deaths),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

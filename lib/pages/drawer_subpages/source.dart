import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widgets
import 'package:covid19_information_center/widgets/navigation/data_card.dart';

// Database


class Source extends StatefulWidget {
  @override
  _SourceState createState() => _SourceState();
}

class _SourceState extends State<Source> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Data Sources"),
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
                  padding: const EdgeInsets.only(top: 5.0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 35.0, left: 30.0, right: 30.0, bottom: 50.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.infoCircle, size: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Information",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kBodyTextColor1,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataCard(
                                title1: "World Health Organization ",
                                title2: "(WHO)",
                                text: "       All information on the information page are retrieved from the website of World Health Organization as of April 2021",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.viruses, size: 20.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Nationwide Cases",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kBodyTextColor1,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCard(
                                title1: "Open Disease Data ",
                                title2: "(disease.sh)",
                                text: "       This is the API used to automatically retrieve the data from the following sources below.",
                              ),
                              DataCard(
                                title1: "Worldometer ",
                                title2: "",
                                text: "       This is the main source of data on the COVID-19 cases in the Philippines.",
                              ),
                              DataCard(
                                title1: "John Hopkins University ",
                                title2: "(JHUCSSE)",
                                text: "       This is the secondary source for additional data on the past COVID-19 cases in the Philippines.",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.virus, size: 20.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Bicol Region Cases",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kBodyTextColor1,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCard(
                                title1: "Department of Health ",
                                title2: "(CHD - Bicol)",
                                text: "       All data on the cases from Bicol Region are manually retrieved from the facebook page of Department of Health - Bicol Center for Health Development.",
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
          ],
        ),
      ),
    );
  }
}
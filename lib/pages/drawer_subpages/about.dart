import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widgets

// Database


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("About"),
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
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 30.0, right: 30.0, bottom: 50.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "COVID-19 | PHILIPPINES",
                                    style: TextStyle(
                                      color: kBodyTextColor1,
                                      fontSize: 14.0
                                    ),
                                  ),
                                  Text(
                                      "INFORMATION CENTER",
                                      style: TextStyle(
                                      color: kBodyTextColor1,
                                      letterSpacing: 0.5,
                                      fontSize: 24.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "By John Patrick Prieto",
                                    style: TextStyle(
                                      color: kBodyTextColor1,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "© 2021",
                                    style: TextStyle(
                                      color: kBodyTextColor1,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "     This Mobile Application was made as an activity for one of my subjects, NSTP2-CWTS, which had an activity period from February 27 to April 17, 2021.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                "      Nonetheless, this mobile application was made with the intention of helping the community, not just because it's part of my requirements.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                "      I hope that this application may prove to be beneficial to you and to the community.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Text(
                                "Social Media",
                                style: TextStyle(
                                  color: kBodyTextColor1,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.facebook, color: kAppBarColor),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Facebook: @StudioPrieto",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlueAccent),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Twitter: @studio_prieto",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.solidEnvelope),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Gmail: studioprieto19@gmail.com ",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/app_bar.dart';

class About extends StatefulWidget{

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
        BaseAppBar(

        ),
      body: Column(
        children: <Widget>[
          Container(height: 100,
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
                              "About",
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
                      Text("COVID-19 Information Tracker for Bicol Region\n\n"
                          "Created by John Patrick Prieto \n"
                          "© 2021 \n\n"
                          "Contact Information: \n"
                          "\t\tprieto.patrick15@gmail.com \n"
                          "\t\t09564499061\n\n"
                          "Concerns? Submit a Feedback\n\n"
                          "Insert Feedback Button here"),
                    ],
                  ),
                ],
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 30, bottom: 20),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Data Retrieved from: \n"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset("assets/images/DOH_logo.svg", height: 90, width: 90),
                    ),
                    Text("\t\tDepartment of Health\n"
                        "\t\tBicol Center for Health Development"),
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

import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preload_page_view/preload_page_view.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/app_bar.dart';

class Information extends StatefulWidget{

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              "Information",
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
                        width: 10,
                      ),
                      Text("COVID-19 Guidelines:\n"
                          "\t\tInsert Text\n\n"
                          "How to wear masks properly:\n"
                          "\t\tInsert Text\n\n"
                          "Myths:\n"
                          "\t\tInsert Text\n\n"),
                    ],
                  ),
                ],
              )
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                    ),
                    Text("Wear Mask, Wash Hands, Keep Distance"),
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

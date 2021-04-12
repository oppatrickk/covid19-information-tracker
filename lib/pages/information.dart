import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/information_card.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Stack(
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
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Column(
                    children: [
                      InformationCard(
                        information: "Symptoms",
                      ),
                      InformationCard(
                        information: "Myths",
                      ),
                      InformationCard(
                        information: "Facts",
                      ),
                      InformationCard(
                        information: "Hotline",
                      ),
                      InformationCard(
                        information: "Lockdown",
                      ),
                      InformationCard(
                        information: "Travel Guidelines",
                      ),
                      InformationCard(
                        information: "Vaccines",
                      ),
                      InformationCard(
                        information: "Variants",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

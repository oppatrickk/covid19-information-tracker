import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

// Pages

// Widgets


class RegionWeekly extends StatefulWidget {
  @override
  _RegionWeeklyState createState() => _RegionWeeklyState();
}

class _RegionWeeklyState extends State<RegionWeekly> {
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
                      width: MediaQuery.of(context).size.width
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

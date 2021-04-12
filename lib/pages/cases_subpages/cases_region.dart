import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';

// Pages
import 'package:covid19_information_center/pages/cases_subpages/cases_region_subpages/cases_region_daily.dart';
import 'package:covid19_information_center/pages/cases_subpages/cases_region_subpages/cases_region_weekly.dart';

// Widgets

class Region extends StatefulWidget{

  @override
  _RegionState createState() => _RegionState();
}

class _RegionState extends State<Region> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Bicol Region Cases"),
            backgroundColor: kAppBarColor,
            elevation: 0,
            titleSpacing: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: kSelectedUIColor,
              onTap: (index) {
                // Tab index when user select it, it start from zero
              },
              tabs: [
                Tab(text: "Daily"),
                Tab(text: "Weekly"),
              ],
              labelColor: kSelectedUIColor,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
              unselectedLabelColor: kUnselectedUIColor,
            ),
          ),
          body: TabBarView(
            children: [
              RegionDaily(),
              RegionWeekly(),
            ],
          ),
        ),
    );
  }
}
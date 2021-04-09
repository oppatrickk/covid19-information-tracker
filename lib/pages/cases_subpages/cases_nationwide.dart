import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// Widgets

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';

class Nationwide extends StatefulWidget {
  @override
  _NationwideState createState() => _NationwideState();
}

class _NationwideState extends State<Nationwide> {

  var numFormat = NumberFormat('#,###,000');

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FetchDataProvider>(context);

    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Nationwide Cases"),
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
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Add Refresh here
                    },
                    child: ListView(
                      children: [
                        Container(
                          child: Text(provider.randomJson[1].country),

                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/constant.dart';

// Widgets

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
          title: Text("Data Source"),
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
                  padding: const EdgeInsets.only(top: 35.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Add Refresh here
                    },
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, bottom: 50.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              ],
                            ),
                          ),
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
import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widgets
import 'file:///C:/Users/Patrick/Documents/Projects/Programming/Flutter/covid19_information_center/lib/database/firebase_data.dart';
import 'file:///C:/Users/Patrick/Documents/Projects/Programming/Flutter/covid19_information_center/lib/database/diseasesh_data.dart';
import 'package:covid19_information_center/widgets/main_app_bar.dart';

class InitializeData extends StatefulWidget {
  @override
  _InitializeDataState createState() => _InitializeDataState();
}

class _InitializeDataState extends State<InitializeData> {
  final _db =
  FirebaseDatabase.instance.reference().child("sheets").child("Daily");
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  var totalCases;
  var activeCases;
  var recoveries;
  var deaths;
  var date;

  var numFormatter = NumberFormat('#,###,###');

  fetchFirebase() async {
    await Future.delayed(Duration(seconds: 1));
    await _db.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((k, v) {
        setState(() {
          totalCases = v["total_cases"];
          activeCases = v["active_cases"];
          recoveries = v["recoveries"];
          deaths = v["deaths"];
          date = v["date"];
        });
      });
    });
  }

  @override
  void initState() {
    fetchFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (totalCases == null) {
            return Container(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: Column(
                    children: [
                      GlowingProgressIndicator(
                        child: HeartbeatProgressIndicator(
                          child: FaIcon(FontAwesomeIcons.shieldVirus,
                              color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Loading Data",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                )
            );
          }
          else {
            return MainAppBar();
          }
        },
      ),
    );
  }
}

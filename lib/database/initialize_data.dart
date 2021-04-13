import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_service.dart';
import 'package:covid19_information_center/database/worldometer/backup_service.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_service.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_service.dart';

import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';

// Widgets
import 'package:covid19_information_center/widgets/navigation/main_app_bar.dart';


class LoadingData extends StatefulWidget {
  @override
  _LoadingDataState createState() => _LoadingDataState();
}


class _LoadingDataState extends State<LoadingData> {
  WorldometerApiService worldometerApiService = WorldometerApiService();
  BackupApiService backupApiService = BackupApiService();
  JhucsseApiService jhucsseApiService = JhucsseApiService();

/*
  Query _query;

  @override
  void initState() {
    Database.queryMountains().then((Query query) {
      setState(() {
        _query = query;
      });
    });

    super.initState();
  }

 */

  @override
  Widget build(BuildContext context) {
    Provider.of<FetchWorldometerDataProvider>(context);
    Provider.of<FetchBackupDataProvider>(context);
    Provider.of<FetchJhucsseDataProvider>(context);
    Provider.of<FetchVaccineDataProvider>(context);
    Provider.of<FetchFirebaseDataProvider>(context);

    final Future<FirebaseApp> _future = Firebase.initializeApp();
    final provider = Provider.of<FetchWorldometerDataProvider>(context);

    return Scaffold(
        body: provider.loading == true
            ? Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2 - 100),
            child: Center(
              child: Column(
                children: [
                  GlowingProgressIndicator(
                    child: HeartbeatProgressIndicator(
                      child: FaIcon(FontAwesomeIcons.shieldVirus,
                          size: 34,
                          color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(height: 34),
                  Text(
                    "Loading Data",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            )
        )
            : MainAppBar(),
    );
  }
}



/*

// Widgets
import 'package:covid19_information_center/database/firebase_service.dart';
import 'file:///C:/Users/Patrick/Documents/Projects/Programming/Flutter/covid19_information_center/lib/database/service.dart';
import 'package:covid19_information_center/widgets/main_app_bar.dart';

class InitializeData extends StatefulWidget {
  @override
  _InitializeDataState createState() => _InitializeDataState();
}

class _InitializeDataState extends State<InitializeData> {
  Query _query;

  @override
  void initState() {
    Database.queryMountains().then((Query query) {
      setState(() {
        _query = query;
      });
    });

    super.initState();
  }

  final Future<FirebaseApp> _future = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    Widget body = new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text("The list is empty..."),
        )
      ],
    );

    if (_query != null) {
      body = new FirebaseAnimatedList(
        query: _query,
        itemBuilder: (
            BuildContext context,
            DataSnapshot snapshot,
            Animation<double> animation,
            int index,
            )
        {
          String mountainKey = snapshot.key;
          Map map = snapshot.value;
          String name = map['date'] as String;
          return Column(
            children: <Widget>[
              ListTile(
                title: Text('$name'),
              ),
              Divider(
                height: 2.0,
              ),
            ],
          );
        },
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: body,
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
      ),
    );
  }

}

 */
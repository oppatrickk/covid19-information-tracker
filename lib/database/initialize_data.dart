import 'package:covid19_information_center/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



// Database
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';


class LoadingData extends StatefulWidget {
  @override
  _LoadingDataState createState() => _LoadingDataState();
}


class _LoadingDataState extends State<LoadingData> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<FetchDataProvider>(context);

    final provider = Provider.of<FetchDataProvider>(context);

    return Scaffold(
        body: provider.loading == true
            ? Container(
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
        )
            : MainAppBar(),
    );
  }
}



/*

import 'package:firebase_database/ui/firebase_animated_list.dart';
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
import 'package:covid19_information_center/database/firebase_data.dart';
import 'file:///C:/Users/Patrick/Documents/Projects/Programming/Flutter/covid19_information_center/lib/database/diseasesh_service.dart';
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
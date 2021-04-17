import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_service.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_service.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_service.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_service.dart';
import 'package:covid19_information_center/database/firebase/firebase_service.dart';

import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';

// Widgets
import 'package:covid19_information_center/widgets/navigation/main_app_bar.dart';


class LoadingData extends StatefulWidget {
  @override
  _LoadingDataState createState() => _LoadingDataState();
}


class _LoadingDataState extends State<LoadingData> {
  WorldometerApiService worldometerApiService = WorldometerApiService();
  WorldometerBackupApiService backupApiService = WorldometerBackupApiService();
  JhucsseApiService jhucsseApiService = JhucsseApiService();
  JhucsseBackupApiService jhucsseBackupApiService = JhucsseBackupApiService();
  FirebaseApiService firebaseApiService = FirebaseApiService();

  @override
  Widget build(BuildContext context) {
    Provider.of<FetchWorldometerDataProvider>(context);
    Provider.of<FetchWorldometerBackupDataProvider>(context);
    Provider.of<FetchJhucsseDataProvider>(context);
    Provider.of<FetchJhucsseBackupDataProvider>(context);
    Provider.of<FetchFirebaseDataProvider>(context);

    final provider = Provider.of<FetchWorldometerDataProvider>(context);

    return Scaffold(
        body: provider.loading == true
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
            : MainAppBar(),
    );
  }
}
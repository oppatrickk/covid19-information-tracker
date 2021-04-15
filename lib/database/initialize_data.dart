import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_service.dart';
import 'package:covid19_information_center/database/worldometer/backup_service.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_service.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_service.dart';
import 'package:covid19_information_center/database/firebase/firebase_service.dart';

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
  VaccineApiService vaccineeApiService = VaccineApiService();
  FirebaseApiService firebaseApiService = FirebaseApiService();

  @override
  Widget build(BuildContext context) {
    Provider.of<FetchWorldometerDataProvider>(context);
    Provider.of<FetchBackupDataProvider>(context);
    Provider.of<FetchJhucsseDataProvider>(context);
    Provider.of<FetchVaccineDataProvider>(context);
    Provider.of<FetchFirebaseDataProvider>(context);

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
import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FetchWorldometerDataProvider>(
            create: (_) => FetchWorldometerDataProvider()),
        ChangeNotifierProvider<FetchBackupDataProvider>(
            create: (_) => FetchBackupDataProvider()),
        ChangeNotifierProvider<FetchJhucsseDataProvider>(
            create: (_) => FetchJhucsseDataProvider()),
      ],
      child: MaterialApp(
        title: 'COVID-19 Information Center',
        theme: ThemeData(
            fontFamily: "NotoSansJP",
            textTheme: TextTheme(
              bodyText2: TextStyle(color: kBodyTextColor),
            )),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoadingData(),
        ),
      ),
    );
  }
}

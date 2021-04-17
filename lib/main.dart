import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_provider.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';
import 'package:firebase_core/firebase_core.dart';

// Widgets
import 'package:covid19_information_center/widgets/navigation/scroll_behavior.dart';

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
        ChangeNotifierProvider<FetchWorldometerBackupDataProvider>(
            create: (_) => FetchWorldometerBackupDataProvider()),
        ChangeNotifierProvider<FetchJhucsseDataProvider>(
            create: (_) => FetchJhucsseDataProvider()),
        ChangeNotifierProvider<FetchJhucsseBackupDataProvider>(
            create: (_) => FetchJhucsseBackupDataProvider()),
        ChangeNotifierProvider<FetchFirebaseDataProvider>(
            create: (_) => FetchFirebaseDataProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        themeMode: ThemeMode.light,
        title: 'COVID-19 Information Center',
        theme: ThemeData(
            fontFamily: "NotoSansJP",
            highlightColor: Color(0xFF3383CD),
            textTheme: TextTheme(
              bodyText2: TextStyle(color: kBodyTextColor),
            ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoadingData(),
        ),
      ),
    );
  }
}

import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';

// Widgets
import 'package:covid19_information_center/widgets/main_app_bar.dart';

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
        ChangeNotifierProvider<FetchDataProvider>(
            create: (_) => FetchDataProvider())
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

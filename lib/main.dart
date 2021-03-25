import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid19_information_center/pages/home.dart';
import 'package:covid19_information_center/pages/case.dart';
import 'package:covid19_information_center/pages/information.dart';
import 'package:covid19_information_center/pages/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Information Center',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "NotoSansJP",
        textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
        )
      ),
      initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/case': (context) => CaseSum(),
          '/information': (context) => Information(),
          '/about': (context) => About(),
        }
    );
  }
}



import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';

// Widgets
import 'package:covid19_information_center/widgets/app_bar.dart';
import 'package:covid19_information_center/widgets/page_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
      home: Scaffold(
          bottomNavigationBar:
          BaseAppBar(),
          body: Container(
            child: PageViewer(),
        )
      ),
    );
  }
}






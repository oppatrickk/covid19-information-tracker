import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/info_card.dart';
import 'package:covid19_information_center/widgets/app_bar.dart';

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
          BaseAppBar(
          ),
        body: Column(
        children: <Widget>[
          Container(height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    // child: SvgPicture.asset("assets/icons/menu.svg"), Add Icon here later
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 50,
                            left: 30,
                            child: Text(
                              "Home Page",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            color: kPrimaryColor.withOpacity(0.10),
            child: Wrap(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Case Summary >"),
                           ],
                         ),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

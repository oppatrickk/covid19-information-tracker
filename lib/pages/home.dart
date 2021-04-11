import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Pages

// Widgets
import 'package:covid19_information_center/widgets/home/cases_percentage.dart';
import 'package:covid19_information_center/widgets/home/mask_hugas_iwas.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_provider.dart';
import 'package:covid19_information_center/database/worldometer/backup_provider.dart';
import 'package:covid19_information_center/database/jhucsse/jhucsse_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var decimalOne = NumberFormat('#,###,###.0');
    var decimalTwo = NumberFormat('#,###,###.00');
    var numbers = NumberFormat('#,###,###');


    final worldometer = Provider.of<FetchWorldometerDataProvider>(context);
    final jhucsse = Provider.of<FetchJhucsseDataProvider>(context);

    var provider;

    if (worldometer.countries[157].todayCases == 0)
    {
      provider = Provider.of<FetchBackupDataProvider>(context);
    }
    else
    {
      provider = Provider.of<FetchWorldometerDataProvider>(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            color: kAppBarColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "COVID-19 | PHILIPPINES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "INFORMATION CENTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Text(
                      "Total Confirmed Cases",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kBodyTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      numbers.format(provider.countries[157].cases),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: kBodyTextColor1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "+",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text(
                            numbers
                                .format(provider.countries[157].todayCases),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text(
                            " added on 04/10/21",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CasesPercentage(
                          width: provider.countries[157].percentageActive * 3,
                          text1: decimalOne.format(provider.countries[157].percentageActive),
                          text2: "Active",
                          color: Colors.greenAccent,
                          radius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomLeft: Radius.circular(45),
                          ),
                        ),
                        CasesPercentage(
                          width: provider.countries[157].percentageRecovered * 3,
                          text1: decimalOne.format(provider.countries[157].percentageRecovered),
                          text2: "Recovered",
                          color: Colors.blueAccent,
                          radius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaskHugasIwas(
                          icon: FontAwesomeIcons.headSideMask,
                          iconColor: Colors.white,
                          textColor: Colors.white,
                          bgColor: kAppBarColor.withOpacity(0.9),
                          title1: "WEAR",
                          title2: "MASK",
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                        ),
                        MaskHugasIwas(
                          icon: FontAwesomeIcons.handsWash,
                          iconColor: Colors.black,
                          textColor: Colors.black,
                          bgColor: Colors.black.withOpacity(0.04),
                          title1: "WASH",
                          title2: "HANDS",
                        ),
                        MaskHugasIwas(
                          icon: FontAwesomeIcons.peopleArrows,
                          iconColor: Colors.white,
                          textColor: Colors.white,
                          bgColor: Color(0xFFCE2317).withOpacity(0.9),
                          title1: "KEEP",
                          title2: "DISTANCE",
                          radius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

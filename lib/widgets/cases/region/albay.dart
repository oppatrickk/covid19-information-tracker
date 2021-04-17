import 'package:flutter/material.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:covid19_information_center/widgets/cases/region/case_list.dart';

class Albay extends StatefulWidget {
  @override
  _AlbayState createState() => _AlbayState();
}

class _AlbayState extends State<Albay> {
  var numbers = NumberFormat('#,###,###');

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<FetchFirebaseDataProvider>(context);

    return Container(
      child: (firebase.bicol[0].activeALBAY != 0)
          ? Container(
              child: Column(
                children: [
                  if (firebase.bicol[0].activeBacacay != 0) CaseList(text: "Bacacay: ${numbers.format(firebase.bicol[0].activeBacacay)}",) else Container(),
                  if (firebase.bicol[0].activeBacacay != 0) CaseList(text: "Bacacay: ${numbers.format(firebase.bicol[0].activeBacacay)}",) else Container(),
                ],
        ),
      )

          : Text("No Cases")
    );
  }
}
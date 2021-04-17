import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class CaseList extends StatelessWidget {
  final text;

  const CaseList({
    Key key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          style: TextStyle(
            color: kBodyTextColor1,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

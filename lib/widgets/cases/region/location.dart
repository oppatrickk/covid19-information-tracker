import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class Location extends StatelessWidget {
  final title;
  final number;

  const Location({
    Key key, this.title, this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: kBodyTextColor2,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 28.0,
                  color: kBodyTextColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
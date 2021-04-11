import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String information;

  const InformationCard({Key key, this.information})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(left: 30, right: 30, bottom: 20),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.only(
            left: 10, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          information,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
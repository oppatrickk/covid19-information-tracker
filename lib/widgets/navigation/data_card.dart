import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class DataCard extends StatelessWidget {
  final title1;
  final title2;
  final text;
  final link;

  const DataCard({
    Key key, this.title1, this.title2, this.text, this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBodyTextColor1,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  title2,
                  style: TextStyle(
                    color: kBodyTextColor2,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Text(
                text,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

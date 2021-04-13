import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class CasesPercentage extends StatelessWidget {
  final width;
  final text1;
  final String text2;
  final color;
  final BorderRadius radius;

  const CasesPercentage({
    Key key, this.width, this.text1, this.text2, this.color, this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8.0,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: radius,
          ),
        ),
        Row(
          children: [
            Text(
              text1,
              style: TextStyle(
                color: kBodyTextColor1,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "%",
              style: TextStyle(
                color: kBodyTextColor1,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          text2,
          style: TextStyle(
            color: kBodyTextColor2,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}

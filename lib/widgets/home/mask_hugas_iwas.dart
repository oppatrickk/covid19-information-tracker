import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaskHugasIwas extends StatelessWidget {
  final BorderRadius radius;
  final bgColor;
  final iconColor;
  final textColor;
  final String title1;
  final String title2;
  final icon;

  const MaskHugasIwas({
    Key key, this.radius, this.bgColor, this.iconColor, this.textColor, this.title1, this.title2, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3.6,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
              children: [
                Text(
                  "$title1",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$title2",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FaIcon(
                    icon,
                    color: iconColor
                ),
              ],
            )
        ),
      ),
    );
  }
}
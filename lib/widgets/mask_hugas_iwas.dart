import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaskHugasIwas extends StatelessWidget {
  final BorderRadius radius;
  final color;
  final Text title1;
  final Text title2;
  final FaIcon icon;

  const MaskHugasIwas({
    Key key, this.radius, this.color, this.title1, this.icon, this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3.6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
              children: [
                title1,
                title2,
                SizedBox(
                  height: 10.0,
                ),
                icon,
              ],
            )
        ),
      ),
    );
  }
}
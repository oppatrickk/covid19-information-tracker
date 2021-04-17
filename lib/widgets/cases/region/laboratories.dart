import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class Laboratories extends StatelessWidget {
final number;

  const Laboratories({
    Key key, this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                number,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

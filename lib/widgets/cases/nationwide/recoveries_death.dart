import 'package:flutter/material.dart';

class RecoveriesDeaths extends StatelessWidget {
  final title;
  final number;
  final color;

  const RecoveriesDeaths({
    Key key, this.title, this.number, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
              number,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
              title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
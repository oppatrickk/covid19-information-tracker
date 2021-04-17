import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Prevention extends StatelessWidget {
  final title;
  final image;

  const Prevention({
    Key key, this.title, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 5.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 3.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ]
            ),
            child: Image.asset(
                image,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
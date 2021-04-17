import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSymptoms extends StatelessWidget {
  final title;
  final image;

  const CommonSymptoms({
    Key key, this.title, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(

            height: MediaQuery.of(context).size.width / 4.5,
            width: MediaQuery.of(context).size.width / 4.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(64.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(64.0),
              child: Image.asset(
                image,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

              ),
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
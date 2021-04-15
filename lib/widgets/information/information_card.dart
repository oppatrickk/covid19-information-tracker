import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class InformationCard extends StatelessWidget {
  final String title;

  const InformationCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _tapped = true;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: () {
          _tapped = false;
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
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
            ],
          ),
          duration: Duration(seconds: 2),
          child: _tapped == true
              ? Text(
                  "To be added soon",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )
              : Column(
                  children: [
                    Text(
                      "Vaccine",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

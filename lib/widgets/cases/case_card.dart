import 'package:flutter/material.dart';

class CaseCard extends StatelessWidget {

  final String title;
  final String date;
  final totalCases;
  final newCases;
  final page;
  final color;
  final backgroundColor;

  const CaseCard({
    Key key, this.title, this.date, this.totalCases, this.newCases, this.page, this.color, this.backgroundColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.only(
              left: 10, top: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Wrap(
            runSpacing: 5,
            spacing: 20,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Total Confirmed Cases",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    totalCases,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "+",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    newCases,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    " Newly Reported Cases",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
                      color: backgroundColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  page),
                        );
                      },
                      child: Text(
                        "View Details",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
  }) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: kBodyTextColor),
                    children: [
                      TextSpan(
                        text: "${widget.effectedNum}",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
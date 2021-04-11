import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Pages

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text("Header",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.help),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Data Source"),
            leading: Icon(Icons.source),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Submit Feedback"),
            leading: Icon(Icons.recommend),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Report Bugs"),
            leading: Icon(Icons.bug_report),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

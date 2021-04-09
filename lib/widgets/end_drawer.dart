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
        children: <Widget>[

          DrawerHeader(
            child: Text("Drawer"),
            decoration: BoxDecoration(
              color: Colors.blue,
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

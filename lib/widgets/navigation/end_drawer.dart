import 'package:covid19_information_center/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Pages
import 'package:covid19_information_center/pages/drawer_subpages/about.dart';
import 'package:covid19_information_center/pages/drawer_subpages/source.dart';
import 'package:covid19_information_center/pages/drawer_subpages/settings.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({
    Key key,
  }) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 212.0,
            width: MediaQuery.of(context).size.width,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: kAppBarColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "COVID-19 | PHILIPPINES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "INFORMATION CENTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("About"),
            leading: FaIcon(FontAwesomeIcons.solidQuestionCircle, size: 25.0),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            title: Text("Data Sources"),
            leading: FaIcon(FontAwesomeIcons.solidFolderOpen, size: 25.0),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Source()));
            },
          ),
          ListTile(
            title: Text("Settings"),
            leading: FaIcon(FontAwesomeIcons.cog, size: 25.0),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          ListTile(
            title: Text("Submit Feedback"),
            leading: Icon(Icons.recommend),
            onTap: () {
              _launchInBrowser("https://forms.gle/Lkokbd6cB5V7w7kz9");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Report Bugs"),
            leading: Icon(Icons.bug_report),
            onTap: () {
              _launchInBrowser("https://forms.gle/QGRo7BQHXaXQo2QKA");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Pages
import 'package:covid19_information_center/pages/home.dart';
import 'package:covid19_information_center/pages/case.dart';
import 'package:covid19_information_center/pages/information.dart';
import 'package:covid19_information_center/pages/about.dart';

class PageViewer extends StatefulWidget {
  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Home(),
        CaseSum(),
        Information(),
        About(),
      ],
    );
  }
}
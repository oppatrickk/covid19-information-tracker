import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19_information_center/widgets/end_drawer.dart';
import 'package:covid19_information_center/constant.dart';

// Pages
import 'package:covid19_information_center/pages/home.dart';
import 'package:covid19_information_center/pages/cases.dart';
import 'package:covid19_information_center/pages/information.dart';
import 'package:covid19_information_center/pages/vaccine.dart';

class MainAppBar extends StatefulWidget {

  final String title;
  final AppBar appBar;
  final List<Widget> widgets;

  const MainAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  PageController _pageController;
  int _page = 0;
  Duration pageChanging = Duration(milliseconds: 300);
  Curve animationCurve = Curves.linear;

  final List<bool> visibilityList = [
    false, true, true, true
  ];

  final List<String> titleList = [
    "",
    "Case Summary",
    "Vaccine Progress",
    "Information"
  ];
  final List<Icon> iconList = [
    Icon(FontAwesomeIcons.home, color: Colors.white),
    Icon(FontAwesomeIcons.virus, color: Colors.white),
    Icon(FontAwesomeIcons.syringe, color: Colors.white),
    Icon(FontAwesomeIcons.infoCircle, color: Colors.white),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: visibilityList[_page],
              child: IconButton(
                icon: iconList[_page],
              ),
            ),
            Text(titleList[_page]),
          ],
        ),
        elevation: 0,
        leadingWidth: 50,
        toolbarHeight: 80,
        actions: <Widget>[],
        backgroundColor: kAppBarColor,
      ),
      endDrawer: BaseDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Home(),
          CaseSum(),
          Vaccine(),
          Information(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: kSelectedBottomNavColor,
        unselectedItemColor: kUnselectedBottomNavColor.withOpacity(.3),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _page,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cases',
            icon: Icon(FontAwesomeIcons.virus),
          ),
          BottomNavigationBarItem(
            label: 'Vaccine',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          BottomNavigationBarItem(
            label: 'Information',
            icon: Icon(FontAwesomeIcons.infoCircle),
          ),
        ],
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: pageChanging,
      curve: animationCurve,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    if (this.mounted) {
      setState(() {
        this._page = page;
      });
    }
  }
}


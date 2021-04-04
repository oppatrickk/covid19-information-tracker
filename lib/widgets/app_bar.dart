import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Pages
import 'package:covid19_information_center/pages/home.dart';
import 'package:covid19_information_center/pages/case.dart';
import 'package:covid19_information_center/pages/information.dart';
import 'package:covid19_information_center/pages/about.dart';

class BaseAppBar extends StatefulWidget{
  final String title;
  final AppBar appBar;
  final List<Widget> widgets;

  const BaseAppBar(
      {Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  _BaseAppBarState createState() => _BaseAppBarState();

}

class _BaseAppBarState extends State<BaseAppBar> {

  PageController _pageController;
  int _page = 0;
  Duration pageChanging = Duration(milliseconds: 001);
  Curve animationCurve = Curves.linear;
  final List<String> titleList = [
    "COVID-19 Information Tracker",
    "Case Summary",
    "Information",
    "About"
  ];
  final List<Icon> iconList = [
    Icon(Icons.coronavirus, color: Colors.white),
    Icon(Icons.leaderboard, color: Colors.white),
    Icon(Icons.sticky_note_2, color: Colors.white),
    Icon(Icons.library_books, color: Colors.white),
  ];
  final List<double> heightList = [
    160, 80, 80, 80
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
            IconButton(
              icon: iconList[_page],
            ),
            Text(titleList[_page]),
          ],
        ),
        elevation: 0,
        leadingWidth: 50,
        toolbarHeight: heightList[_page],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ])),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Home(),
          CaseSum(),
          Information(),
          About(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue.withOpacity(.4),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _page,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Cases'),
            icon: Icon(Icons.leaderboard),
          ),
          BottomNavigationBarItem(
            title: Text('Information'),
            icon: Icon(Icons.sticky_note_2),
          ),
          BottomNavigationBarItem(
            title: Text('About'),
            icon: Icon(Icons.library_books),
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

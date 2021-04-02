import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_information_center/main.dart';
import 'package:covid19_information_center/widgets/page_controller.dart';

class BaseAppBar extends StatelessWidget {
  final int selectedItem;

  const BaseAppBar({
    Key key,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue.withOpacity(.4),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: 1,

      items:[
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
    );
  }
}

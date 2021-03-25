import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'package:flutter/cupertino.dart';

class BaseAppBar extends StatelessWidget {
  final int selectedItem;
  final int currentIndex = 0;

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
      currentIndex: currentIndex,

      onTap: (index){
        switch(index){
          case 0:
            Navigator.pushNamed(context, "/home");
            break;
          case 1:
            Navigator.pushNamed(context, "/case");
            break;
          case 2:
            Navigator.pushNamed(context, "/information");
            break;
          case 3:
            Navigator.pushNamed(context, "/about");
            break;
        }
      },
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


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19_information_center/constant.dart';

// Pages

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Text title;
  final AppBar appBar;
  final IconButton leading;

  const BaseAppBar({Key key, this.title, this.appBar, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
          elevation: 0,
          backgroundColor: kAppBarColor,
          leading: leading,
        ),
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
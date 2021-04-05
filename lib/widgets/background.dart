import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:covid19_information_center/widgets/app_bar.dart';

class BaseBackground extends StatefulWidget {
  @override
  _BaseBackgroundState createState() => _BaseBackgroundState();
}

class _BaseBackgroundState extends State<BaseBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Color(0xFF3383CD),
            Color(0xFF11249F),
          ],
        ),
      ),
      child: BaseAppBar(),
    );
  }
}

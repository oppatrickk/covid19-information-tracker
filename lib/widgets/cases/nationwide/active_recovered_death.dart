import 'package:flutter/material.dart';

class ActiveRecoveredDeath extends StatelessWidget {
  final Text number;
  final Text title;
  final Icon icon;

  const ActiveRecoveredDeath({
    Key key, this.number, this.title, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width/4.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 5.0,
          ),
          number,
          title,
        ],
      ),
    );
  }
}

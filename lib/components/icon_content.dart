import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.ico, this.label});

  final IconData ico;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(ico, size: 80.0),
        Text(label.toUpperCase(), style: kLabelTextStyle),
      ],
    );
  }
}

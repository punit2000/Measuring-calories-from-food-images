import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/bmi_components/bmiconstants.dart';

const double iconSize = 50.0;
const sizedBoxHeight = 6.0;

class CardChild extends StatelessWidget {
  final IconData icon;
  final String label;

  CardChild({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          this.label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/bmi_components/bmiconstants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10.0),
        height: 50,
        //width: double.infinity,
        child: Card(
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: const Color(0xFF6161A1),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 2),
                Text(
                  buttonTitle,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

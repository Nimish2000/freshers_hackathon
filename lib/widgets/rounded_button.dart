import 'package:flutter/material.dart';
import 'package:freshers_hackathon/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29.0),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

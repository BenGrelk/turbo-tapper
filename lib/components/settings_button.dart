// Rectangle bordered button with text "Play"

import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  SettingsButton(
      {required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

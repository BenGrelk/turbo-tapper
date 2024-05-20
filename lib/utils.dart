import 'package:flutter/material.dart';

void Function() routeTo(BuildContext context, Widget screen) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  };
}
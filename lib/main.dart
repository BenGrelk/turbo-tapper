import 'package:flutter/material.dart';
import 'screens/play.dart';

void main() => runApp(BirthdayPizzaApp());

class BirthdayPizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
      title: 'BirthdayPizzaApp',
      home: Play(),
      // home: MessageView(),
    ); //MaterialApp
  }

}

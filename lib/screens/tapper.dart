/*
Screen where the user taps a button and the number of taps is counted.
Show "Taps" at the top, followed by the number of taps under it.
Tap button is centered 25% from the bottom of the screen.
Bottom bar has icons for taps(this page), upgrade, and settings.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bottom_nav.dart';
import '../components/settings_button.dart';
import '../models/player_model.dart';

class Tapper extends StatefulWidget {
  @override
  _TapperState createState() => _TapperState();
}

class _TapperState extends State<Tapper> {

  void tap() {
    Provider.of<PlayerModel>(context, listen: false).incrementTaps();
  }

  void Function() routeTo(Widget screen) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taps',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${Provider.of<PlayerModel>(context).taps}',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SettingsButton(
              text: 'Tap',
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              onPressed: tap,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

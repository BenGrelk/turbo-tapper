import 'package:turbo_tapper/screens/settings.dart';
import 'package:flutter/material.dart';

import '../components/settings_button.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

/*
  Play screen with a single column. Name is "Turbo Tapper", followeb by play button.
  Turbo is blue, tappper is red.
  play button is centered
 */

class _PlayState extends State<Play> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Turbo',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tapper',
              style: TextStyle(
                fontSize: 50,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SettingsButton(
              text: 'Play',
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              onPressed: () {
                print('Play button pressed');
              },
            ),
            SettingsButton(
                onPressed: routeTo(Settings()),
                backgroundColor: Colors.indigo,
                textColor: Colors.white,
                text: "Settings")
          ],
        ),
      ),
    );
  }
}

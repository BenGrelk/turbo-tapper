import 'package:turbo_tapper/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:turbo_tapper/screens/tapper.dart';

import '../components/settings_button.dart';
import '../utils.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
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
              onPressed: routeTo(context, Tapper()),
            ),
            SettingsButton(
                onPressed: routeTo(context, Settings()),
                backgroundColor: Colors.indigo,
                textColor: Colors.white,
                text: "Settings")
          ],
        ),
      ),
    );
  }
}

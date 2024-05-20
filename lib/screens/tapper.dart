import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void upgradeTPT() {
    Provider.of<PlayerModel>(context, listen: false).upgradeTPT();
  }

  void upgradeMultiplier() {
    Provider.of<PlayerModel>(context, listen: false).upgradeMultiplier();
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
              "${Provider.of<PlayerModel>(context, listen: false).taps}",
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
            Text(
              'Taps per tap',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${Provider.of<PlayerModel>(context).tapsPerTap} -> ${Provider.of<PlayerModel>(context, listen: false).tapsPerTap + 1}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Provider.of<PlayerModel>(context, listen: false).tapsPerTapCost}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: upgradeTPT,
                  child: Text('Upgrade'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Multiplier',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${Provider.of<PlayerModel>(context).multiplier} -> ${Provider.of<PlayerModel>(context, listen: false).multiplier + 1}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${Provider.of<PlayerModel>(context).multiplierCost}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: upgradeMultiplier,
                  child: Text('Upgrade'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

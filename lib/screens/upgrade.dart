import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bottom_nav.dart';
import '../models/player_model.dart';

class Upgrade extends StatefulWidget {
  @override
  _UpgradeState createState() => _UpgradeState();
}

class _UpgradeState extends State<Upgrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taps per tap',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${Provider.of<PlayerModel>(context).tapsPerTap}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cost: ${Provider.of<PlayerModel>(context).tapsPerTapCost}"),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<PlayerModel>(context, listen: false).upgradeTPT();
                  },
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
              '${Provider.of<PlayerModel>(context).multiplier}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cost: ${Provider.of<PlayerModel>(context).multiplierCost}"),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<PlayerModel>(context, listen: false).upgradeMultiplier();
                  },
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
      bottomNavigationBar: BottomNav(),
    );
  }
}
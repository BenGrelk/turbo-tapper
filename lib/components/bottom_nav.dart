import 'package:flutter/material.dart';

import '../screens/settings.dart';
import '../screens/tapper.dart';
import '../screens/upgrade.dart';
import '../utils.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: routeTo(context, Tapper()),
          ),
          IconButton(
            icon: Icon(Icons.upgrade),
            onPressed: routeTo(context, Upgrade()),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: routeTo(context, Settings()),
          ),
        ],
      ),
    );
  }
}
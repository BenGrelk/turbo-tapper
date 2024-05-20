import 'package:flutter/material.dart';
import 'models/player_model.dart';
import 'screens/play.dart';

import 'package:provider/provider.dart';

class TurboTapperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
      title: 'Turbo Tapper',
      home: Play(),
    ); //MaterialApp
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerModel(),
      child: TurboTapperApp(),
    ),
  );
}

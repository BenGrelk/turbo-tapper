import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

void Function() routeTo(BuildContext context, Widget screen) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  };
}

// play sound asynchrounously
void playPopSound() async {
  // Random num 0-6
  final random = new Random();
  final num = random.nextInt(7);

  // Play sound
  String path = 'assets/sounds/pop${num}.wav';
  print('Playing sound: ${path}');

  // Source audio = UrlSource(path);
  // await player.play(audio);
}

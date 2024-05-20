import 'package:flutter/foundation.dart';
import 'package:turbo_tapper/utils.dart';

class PlayerModel extends ChangeNotifier {
  int _taps = 0;
  int _tapsPerTap = 1;
  int _multiplier = 1;
  int _tapsPerTapCost = 10;
  int _multiplierCost = 100;

  int get taps => _taps;

  int get tapsPerTap => _tapsPerTap;

  int get multiplier => _multiplier;

  int get tapsPerTapCost => _tapsPerTapCost;

  int get multiplierCost => _multiplierCost;

  int _calculateTPTCost() {
    double result = _tapsPerTapCost * _tapsPerTap * 1.5;
    return result.round();
  }

  int _calculateMultiplierCost() {
    double result = _multiplierCost * _multiplier * 1.5;
    return result.round();
  }

  void incrementTaps() {
    _taps += _tapsPerTap * _multiplier;

    // playPopSound();

    notifyListeners();
  }

  void upgradeTPT() {
    if (_taps >= tapsPerTapCost) {
      _taps -= tapsPerTapCost;
      _tapsPerTap += 1;
      _tapsPerTapCost = _calculateTPTCost();
    }
    notifyListeners();
  }

  void upgradeMultiplier() {
    if (_taps >= multiplierCost) {
      _taps -= multiplierCost;
      _multiplier += 1;
      _multiplierCost = _calculateMultiplierCost();

      notifyListeners();
    }
  }
}

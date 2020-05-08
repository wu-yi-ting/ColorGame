import 'dart:math';

import 'package:flutter/material.dart';

class GameChangeNotifier with ChangeNotifier {
  GameChangeNotifier({
    int score,
    int boardSize,
  })  : _score = score ?? 0,
        _boardSize = max(2, boardSize ?? 2) {
    _rightColor = _myColor();
    _defaultColor = _randomColor(_rightColor);
    _target_i = _resetTarget();
    _target_j = _resetTarget();
    _level = _restLevel();
  }

  int _score = 0;
  int _boardSize = 2;
  int _target_i = 0;
  int _target_j = 0;
  Color _defaultColor;
  Color _rightColor;
  int _level = 0;

  void resetAllValue() {
    _score = 0;
    _boardSize = 2;
    _target_i = 0;
    _target_j = 0;
    _level = 0;
  }

  int get score {
    return _score;
  }

  int get boardSize {
    if (_level == 0) {
      return _boardSize;
    }
    return _boardSize + _level;
  }

  int get target_i {
    return _target_i;
  }

  int get target_j {
    return _target_j;
  }

  Color get rightColor {
    return _rightColor;
  }

  Color get defaultColor {
    return _defaultColor;
  }

  int get gameLevel {
    return _level;
  }

  void updateBlockColor() {
    _defaultColor = _myColor();
    _rightColor = _randomColor(_defaultColor);
    _target_i = _resetTarget();
    _target_j = _resetTarget();
    _level = _restLevel();

    notifyListeners();
  }

  void addScore(int newScore) {
    _score += newScore;
    notifyListeners();
  }

  Color _myColor() {
    return Color.fromARGB(255,  Random().nextInt(256),  Random().nextInt(256), Random().nextInt(256));
  }
  Color _randomColor(Color color) {
    double randomAlpha = 255- (150 / _level*2);
    if (randomAlpha <= 150) {
      randomAlpha = 150;
    } else if (randomAlpha >= 255) {
      randomAlpha = 254;
    }
    return Color.fromARGB(randomAlpha.toInt(), color.red, color.green, color.blue);
  }

  int _resetTarget() {
    return Random().nextInt(boardSize);
  }

  int _restLevel() {
    if (_score == 0) {
      return 0;
    }
    return _score ~/ 5;
  }
}

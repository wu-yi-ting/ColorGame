import 'dart:math';

import 'package:flutter/material.dart';

class GameChangeNotifier with ChangeNotifier {
  GameChangeNotifier({
    int score,
    int boardSize,
  })  : _score = score ?? 0,
        _boardSize = max(2, boardSize ?? 2) {
    _defaultColor = _myColor();
    _rightColor = _myColor();
    _target = _resetTarget();
    _level = _restLevel();
  }

  int _score;
  int _boardSize;
  int _target;
  Color _defaultColor;
  Color _rightColor;
  int _level;

  int get score {
    return _score;
  }

  int get boardSize {
    if (_level == 0) {
      return _boardSize;
    }
    return _boardSize + _level;
  }

  int get target {
    return _target;
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
    _rightColor = _myColor();
    _target = _resetTarget();
    _level = _restLevel();

    notifyListeners();
  }

  void addScore(int newScore) {
    _score += newScore;
    notifyListeners();
  }

  Color _myColor() {
    return Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256));
  }

  int _resetTarget() {
    return Random().nextInt(_boardSize * _boardSize);
  }

  int _restLevel() {
    if (_score == 0) {
      return 0;
    }
    return _score ~/ 2;
  }
}

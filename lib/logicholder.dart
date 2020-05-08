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
  }

  int _score;
  int _boardSize;
  int _target;
  Color _defaultColor;
  Color _rightColor;

  int get score {
    return _score;
  }

  int get boardSize {
    return _boardSize;
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

  void updateBlockColor() {
    _defaultColor = _myColor();
    _rightColor = _myColor();
    _target = _resetTarget();

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
}

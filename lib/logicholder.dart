import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GameChangeNotifier with ChangeNotifier {
  GameChangeNotifier({
    int score,
    int boardSize,
  }) {
    _score = score ?? 0;
    _updateLevel();
    _initBoardSize = min(2, boardSize ?? 2);
    _updateColor();
    _updateTarget();
  }

  int _score;
  int _initBoardSize;
  Coordinate _target;
  Color _defaultColor;
  Color _targetColor;
  int _level = 0;
  Random _random = Random();

  void resetAllValue() {
    _score = 0;
    _updateLevel();
    _updateColor();
    _updateTarget();
  }

  int get score {
    return _score;
  }

  int get boardSize {
    if (_level == 0) {
      return _initBoardSize;
    }
    return _initBoardSize + _level;
  }

  Coordinate get target {
    return _target;
  }

  Color get rightColor {
    return _targetColor;
  }

  Color get defaultColor {
    return _defaultColor;
  }

  int get gameLevel {
    return _level;
  }

  void updateBlockColor() {
    _updateColor();
    _updateLevel();
    _updateTarget();

    notifyListeners();
  }

  void addScore(int newScore) {
    _score += newScore;
    notifyListeners();
  }

  void _updateColor() {
    final alpha = 255;
    final r = 30 + _random.nextInt(166);
    final g = 30 + _random.nextInt(166);
    final b = 30 + _random.nextInt(166);

    final maxPercentage = 1.0 - min(0.9, sqrt(score) / 5.0);
    final minPercentage = 1.0 - min(0.95, sqrt(score + 3) / 5.0);
    final diffPercantage = maxPercentage - minPercentage;
    final sign = _random.nextBool() ? 1 : -1;
    final targetDiff =
        sign * 128 * (minPercentage + _random.nextDouble() * diffPercantage);

    _defaultColor = Color.fromARGB(alpha, r, g, b);
    _targetColor = Color.fromARGB(
      alpha,
      min(255, max(0, (r + targetDiff.floor()))),
      min(255, max(0, (g + targetDiff.floor()))),
      min(255, max(0, (b + targetDiff.floor()))),
    );
  }

  void _updateTarget() {
    _target = Coordinate(
      _random.nextInt(boardSize),
      _random.nextInt(boardSize),
    );
  }

  void _updateLevel() {
    _level = (_score + 1) ~/ 2;
  }
}

class Coordinate extends Equatable {
  Coordinate(this.x, this.y) : assert(x != null && y != null);

  final int x;
  final int y;

  @override
  String toString() => '($x, $y)';

  @override
  List<Object> get props => [x, y];
}

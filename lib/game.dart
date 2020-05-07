import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遊戲開始'),
      ),
      body: _GamePage(),
    );
  }
}

class _GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameBoard(),
    );
  }
}

const int BOARD_HEIGHT = 2;
const int BOARD_WIDTH = 2;

class GameBoard extends StatelessWidget {
  const GameBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updateBlockColor(); //設定顏色
    int num = HighLightBlock();
    print('hello'); //               <-- logging
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          for (var j = 0; j < BOARD_HEIGHT; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < BOARD_WIDTH; i++)
                  _ColorRect(num, (j * 2 + i))
              ],
            ),
        ],
      ),
    );
  }
}

class _ColorRect extends StatelessWidget {
  int right = 0;
  int position = 0;

  _ColorRect(this.right, this.position);

  @override
  Widget build(BuildContext context) {
    if (right == position) {
      return MaterialButton(
        color: _rightColor, //顏色要random
        height: 50,
        minWidth: 50,
        onPressed: () {
          //TODO: 按對 加1分 並重新刷新畫面
        },
      );
    } else {
      return MaterialButton(
        color: _defaultColor, //顏色要random
        height: 50,
        minWidth: 50,
        onPressed: () {
          //按錯沒反應
        },
      );
    }
  }
}

Color _defaultColor;
Color _rightColor;

void updateBlockColor() {
  _defaultColor = MyColor();
  _rightColor = MyColor();
}

Color MyColor() {
  return Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
}

int HighLightBlock() {
  int num = Random().nextInt(BOARD_HEIGHT * BOARD_WIDTH);
  return num;
}

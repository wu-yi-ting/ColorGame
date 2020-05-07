import 'package:flutter/material.dart';

const int _blockNumber = 9;

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
                  _ColorRect(),
              ],
            ),
        ],
      ),
    );
  }
}

class _ColorRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.orange, //顏色要random

      height: 50,
      minWidth: 50,
      onPressed: () {
        //TODO: 按對 加1分 並重新刷新畫面
        //按錯沒反應
      },
    );
  }
}

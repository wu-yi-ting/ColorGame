import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logicholder.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('遊戲開始'),
//      ),
//      body: _GamePage(),
//    );
//  }

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遊戲開始'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'score = ${Provider.of<GameChangeNotifier>(context).score}',
              style: Theme.of(context).textTheme.headline1,
            ),
            GameBoard(),
          ],
        ),
      ),
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameChangeNotifier>(context);
    return Container(
      child: Column(
        children: <Widget>[
          for (var j = 0; j < game.boardSize; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < game.boardSize; i++)
                  ColorRect(position: j * 2 + i)
              ],
            ),
        ],
      ),
    );
  }
}

class ColorRect extends StatelessWidget {
  ColorRect({this.position = 0});

  final int position;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameChangeNotifier>(context, listen: false);
    return game.target == position
        ? MaterialButton(
            color: game.rightColor, //顏色要random
            height: 50,
            minWidth: 50,
            onPressed: () {
              // 按對 加1分 並重新刷新畫面
              game.addScore(1);
              game.updateBlockColor();
            },
          )
        : MaterialButton(
            color: game.defaultColor, //顏色要random
            height: 50,
            minWidth: 50,
            onPressed: () {
              //按錯沒反應
            },
          );
  }
}

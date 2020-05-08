import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

import 'logicholder.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

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
            Countdown(
              duration: Duration(seconds: 60),
              onFinish: () {
                Navigator.pushNamed(context, '/Third');
              },
              builder: (BuildContext ctx, Duration remaining) {
                return Text('${remaining.inMinutes}:${remaining.inSeconds}');
              },
            ),
            Text(
              'score = ${Provider.of<GameChangeNotifier>(context).score}',
              style: TextStyle(
                fontSize: 50,
                color: Colors.black45
              ),
            ),
            Spacer(flex: 1),
            GameBoard(),
            Spacer(flex: 1),
            MaterialButton(
              textTheme: ButtonTextTheme.normal,
              onPressed: () {
                Navigator.pushNamed(context, '/Third');
              },
              child: Text(
                "結束",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.orange,
              disabledTextColor: Colors.white,
              textColor: Colors.white,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            Spacer(flex: 1),
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

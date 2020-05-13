import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'dart:math';
import 'logicholder.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/game.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            height: min(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width),
            width: min(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Countdown(
                          duration: Duration(seconds: 60),
                          onFinish: () {
                            Navigator.pushNamed(context, '/Third');
                          },
                          builder: (BuildContext ctx, Duration remaining) {
                            return Text(
                              '${remaining.inSeconds}',
                              style: TextStyle(
                                  color: Color(0xff7d5a5a), fontSize: 50),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Level : ${Provider.of<GameChangeNotifier>(context).gameLevel}',
                                style: TextStyle(
                                    color: Color(0xff7d5a5a), fontSize: 20),
                              ),
                              Text(
                                ', Score : ${Provider.of<GameChangeNotifier>(context).score}',
                                style: TextStyle(
                                    color: Color(0xff7d5a5a), fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: FittedBox(child: GameBoard())),
//                      Padding(
//                        padding: const EdgeInsets.all(20),
//                        child: MaterialButton(
//                          textTheme: ButtonTextTheme.normal,
//                          onPressed: () {
//                            Navigator.pushNamed(context, '/Third');
//                          },
//                          child: Text(
//                            "結束",
//                            style: TextStyle(fontSize: 20),
//                          ),
//                          color: Color(0xff7d5a5a),
//                          disabledTextColor: Colors.white,
//                          textColor: Colors.white,
//                          padding: EdgeInsets.all(10),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(20)),
//                        ),
//                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5),
          color: Colors.white,
          // 设置圆角
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: <Widget>[
          for (var j = 0; j < game.boardSize; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < game.boardSize; i++)
                  ColorRect(pos_i: j, pos_j: i)
              ],
            ),
        ],
      ),
    );
  }
}

class ColorRect extends StatelessWidget {
  ColorRect({this.pos_i = 0, this.pos_j = 0});

  final int pos_i;
  final int pos_j;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameChangeNotifier>(context, listen: false);
    return (game.target_i == pos_i && game.target_j == pos_j)
        ? Container(
            padding: EdgeInsets.all(2),
            child: MaterialButton(
              color: game.rightColor, //顏色要random
              height: 50,
              minWidth: 50,
              onPressed: () {
                // 按對 加1分 並重新刷新畫面
                game.addScore(1);
                game.updateBlockColor();
              },
            ),
          )
        : Container(
            padding: EdgeInsets.all(2),
            child: MaterialButton(
              color: game.defaultColor, //顏色要random
              height: 50,
              minWidth: 50,
              onPressed: () {
                //按錯沒反應
              },
            ),
          );
  }
}

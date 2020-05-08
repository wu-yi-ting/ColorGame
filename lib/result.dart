import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logicholder.dart';

class ResultPage extends StatefulWidget {
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1d1d1),
      body: Center(
        child: ResultLayout(),
      ),
    );
  }
}

class ResultLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Text('遊戲結束', style: TextStyle(color: Color(0xff7d5a5a), fontSize: 80)),
        Text('score=${Provider.of<GameChangeNotifier>(context).score}',
            style: TextStyle(color: Color(0xff7d5a5a), fontSize: 80)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: MaterialButton(
            textTheme: ButtonTextTheme.normal,
            onPressed: () {
              Navigator.pushNamed(context, '/First');
              Provider.of<GameChangeNotifier>(context).resetAllValue();
            },
            child: Text(
              "回首頁",
              style: TextStyle(fontSize: 20),
            ),
            color: Color(0xff7d5a5a),
            disabledTextColor: Colors.white,
            textColor: Colors.white,
            padding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ]),
    );
  }
}

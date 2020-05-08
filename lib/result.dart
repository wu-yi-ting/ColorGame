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
      appBar: AppBar(
        title: Text('遊戲結束'),
        automaticallyImplyLeading: false,
      ),
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
      child: Column(children: <Widget>[
        Text('score=${Provider.of<GameChangeNotifier>(context).score}'),
        MaterialButton(
          textTheme: ButtonTextTheme.normal,
          onPressed: () {
            Navigator.pushNamed(context, '/First');
            Provider.of<GameChangeNotifier>(context).resetAllValue();
          },
          child: Text(
            "回首頁",
            style: TextStyle(fontSize: 20),
          ),
          color: Colors.orange,
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          padding: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ]),
    );
  }
}

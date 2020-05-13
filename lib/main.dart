import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'game.dart';
import 'logicholder.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var debugPrint = (String message, {int wrapWidth}) {};

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) => ChangeNotifierProvider<GameChangeNotifier>(
        create: (_) => GameChangeNotifier(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/First', //1
          routes: {
            '/First': (context) => MyHomePage(title: 'Bella Demo'),
            "/Second": (context) => GamePage(),
            "/Third": (context) => ResultPage()
          },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1d1d1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: AutoSizeText(
                  "Color Game",
                  style: TextStyle(color: Color(0xff7d5a5a), fontSize: 150),
                  maxLines: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                textTheme: ButtonTextTheme.normal,
                onPressed: () {
                  Navigator.pushNamed(context, '/Second');
                },
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 20),
                ),
                color: Color(0xff7d5a5a),
                disabledTextColor: Colors.white,
                textColor: Colors.white,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

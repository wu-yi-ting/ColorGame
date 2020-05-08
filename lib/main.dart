import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Text(
              '顏色小遊戲',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              '選擇所有色塊顏色不同是哪個!!!',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
              textTheme: ButtonTextTheme.normal,
              onPressed: () {
                Navigator.pushNamed(context, '/Second');
              },
              child: Text(
                "快開始吧",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.orange,
              disabledTextColor: Colors.white,
              textColor: Colors.white,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}

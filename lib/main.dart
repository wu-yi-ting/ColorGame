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
            '/First': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
            "/Second": (context) => GamePage(),
            "/Thrid": (context) => ResultPage()
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              '色弱遊戲',
              style: TextStyle(fontSize: 40),
            ),
            Spacer(flex: 1),
            Text(
              '選擇所有色塊顏色不同是哪個!!!',
              style: TextStyle(fontSize: 20),
            ),
            Spacer(flex: 1),
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
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

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
      child: _createGridView(),

//      child: RaisedButton(
//        child: Text('返回首頁'),
//        onPressed: () {
//          Navigator.pop(context);
//        },
//      ),
    );
  }
}

Widget _createGridView() {
  return GridView.builder(
    itemCount: 4,
    //TODO:動態調整
    shrinkWrap: true,
    padding: EdgeInsets.all(10),
    // padding
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 每一行的个数
      mainAxisSpacing: 10, // 间距
      crossAxisSpacing: 10,
    ),
    itemBuilder: (context, index) {
      return Container(
        alignment: Alignment.center,
        child: AspectRatio(
            aspectRatio: 1, // 宽高比
            child: _ColorRect()),
      );
    },
  );
}

class _ColorRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange, //顏色要random
      child: AspectRatio(
        aspectRatio: 1 / 1,
      ),
      onPressed: () {
        //TODO: 按對 加1分 並重新刷新畫面
        //按錯沒反應
      },
    );
  }
}

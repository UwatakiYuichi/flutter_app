import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexState = 0;

  List<Widget> displays = [
    Container(
        color: Colors.black,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ))),
    Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ホームページ"),
            ElevatedButton(
              onPressed: () {/* ボタンが押された時の処理 */},
              child: Text(
                'ただのボタン',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 100),
                  primary: Colors.green, //ボタンの背景色
                  onPrimary: Colors.red, //
                ),
                onPressed: () {
                  print("リッチなボタン!!");
                },
                onLongPress: () {
                  print("長押しですわよ!");
                },
                child: Icon(Icons.camera)),
            ElevatedButton(
              onPressed: () {/* ボタンが押された時の処理 */},
              child: Text('枠線付きボタン'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple, //ボタンの背景色
                  side: BorderSide(color: Colors.deepOrange, width: 2)),
            ),
          ],
        )))
  ];

  @override
  void initState() {
    super.initState();

    print("ホーム");

    runIndicator();
  }

  void runIndicator() async {
    await asyncFunc("data1", 1);
    print("終わった1");

    indexState = 1;
    setState(() {});
  }

  // 非同期で待機する
  Future<String> asyncFunc(String name, int time) async {
    return Future.delayed(Duration(seconds: time), () {
      return name + ":" + DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return displays[indexState];
  }
}

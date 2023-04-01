import 'package:flutter/material.dart';
import 'package:widet_test/second_page.dart';

class FirstPage extends StatelessWidget {
  // イニシャライザ(コンストラクみたいなもの)
  FirstPage(this.index);
  String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ページ(1)")),
        body: Center(
            child: Column(children: [
          Text('!!パラメータを遷移元からし受け取るなり〜 $index'),
          TextButton(
            child: Text(
              "最初のページに戻る",
              style: TextStyle(color: Colors.black),
            ),

            // （1） 前の画面に戻る
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("シーン2に行くわよぅ!"))
        ])));
  }
}

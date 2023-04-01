import 'package:flutter/material.dart';
import 'package:widet_test/third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ページ(2)")),
        body: Center(
            child: Column(
          children: [
            TextButton(
              child: Text(
                "最初のページに戻る",
                style: TextStyle(color: Colors.orange),
              ),

              // （1） 前の画面に戻る
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(
                "サードページへ",
                style: TextStyle(color: Colors.orange),
              ),

              // （1） 前の画面に戻る
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
            ),
          ],
        )));
  }
}

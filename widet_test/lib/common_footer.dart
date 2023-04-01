import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  int _n = 10;

  void _push() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(125, 196, 255, 198),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            // onPressed: () {},

            onPressed: _push,

            // 表示アイコン
            icon: Icon(Icons.home),
            // アイコン色
            color: Colors.pink,
            // サイズ
            iconSize: 24,
          ),
          IconButton(
            // onPressed: () {},

            onPressed: _push,

            // 表示アイコン
            icon: Icon(Icons.info),
            // アイコン色
            color: Colors.black,
            // サイズ
            iconSize: 24,
          ),
          IconButton(
            // onPressed: () {},

            onPressed: _push,

            // 表示アイコン
            icon: Icon(Icons.camera),
            // アイコン色
            color: Colors.blue,
            // サイズ
            iconSize: 24,
          ),
          IconButton(
            // onPressed: () {},

            onPressed: _push,

            // 表示アイコン
            icon: Icon(Icons.thumb_up),
            // アイコン色
            color: Colors.green,
            // サイズ
            iconSize: 24,
          ),
          IconButton(
            // onPressed: () {},

            onPressed: _push,

            // 表示アイコン
            icon: Icon(Icons.download),
            // アイコン色
            color: Colors.black,
            // サイズ
            iconSize: 24,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                // pushされた分を全てクリアして最初に戻る
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("最初へゴー"))
        ],
      ),
    );
  }
}

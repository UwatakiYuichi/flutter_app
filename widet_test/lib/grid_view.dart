import 'package:flutter/material.dart';

class GriViewCount extends StatefulWidget {
  const GriViewCount({super.key});

  @override
  State<GriViewCount> createState() => _GriViewCountState();
}

class _GriViewCountState extends State<GriViewCount> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 横1行あたりに表示するWidgetの数
      crossAxisCount: 5,
      // Widget間のスペース（左右）
      crossAxisSpacing: 4,
      // Widget間のスペース（上下）
      mainAxisSpacing: 4,
      // 全体の余白
      padding: const EdgeInsets.all(5),
      children: [
        // スプレッド演算子を使って画像を100個生成
        for (int i = 0; i < 100; i++) ...[
          GestureDetector(
            onTap: () {
              print('$iがタップされたんご!');
            },
            child: const Image(
              image: NetworkImage(
                  'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
              fit: BoxFit.cover,
            ),
          )
        ],
      ],
    );
  }
}

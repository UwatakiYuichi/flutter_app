import 'package:flutter/material.dart';

class GriViewExtent extends StatefulWidget {
  const GriViewExtent({super.key});

  @override
  State<GriViewExtent> createState() => _GriViewExtentState();
}

class _GriViewExtentState extends State<GriViewExtent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // GridViewの表示幅を固定
        width: 400,
        child: GridView.extent(
          // maxCrossAxisExtent : 表示させたいWidget１つ辺りの最大横幅を指定
          // GridViewの表示幅 / maxCrossAxisExtent で画面幅内に表示されるWidgetの数が決まる
          // 300 / 50 = 6
          // → 画面横に6つWidgetが並ぶ
          maxCrossAxisExtent: 50,
          // maxCrossAxisExtent: 100,
          // 全体の余白
          padding: const EdgeInsets.all(4),
          // Widget間のスペース（左右）
          mainAxisSpacing: 4,
          // Widget間のスペース（上下）
          crossAxisSpacing: 4,
          children: [
            // スプレッド演算子を使って画像を100個生成
            for (int i = 0; i < 100; i++) ...[
              const Image(
                image: NetworkImage(
                    'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
                fit: BoxFit.cover,
              )
            ],
          ],
        ),
      ),
    );
  }
}

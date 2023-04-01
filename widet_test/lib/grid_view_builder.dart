import 'package:flutter/material.dart';

class GriViewBuilder extends StatefulWidget {
  const GriViewBuilder({super.key});

  @override
  State<GriViewBuilder> createState() => _GriViewBuilderState();
}

class _GriViewBuilderState extends State<GriViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.horizontal,
      // Widgetを何個表示させるかを指定。指定しなければ無限に表示
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 横1行あたりに表示するWidgetの数
        crossAxisCount: 4,
        // Widget間のスペース（左右）
        mainAxisSpacing: 4,
        // Widget間のスペース（上下）
        crossAxisSpacing: 4,
      ),
      // 全体の余白
      padding: const EdgeInsets.all(4),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print('「$index」が押しちゃいましたねハート');
          },
          child: const Image(
            image:
                NetworkImage('https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

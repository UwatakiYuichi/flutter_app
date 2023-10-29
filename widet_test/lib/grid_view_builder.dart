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
        // itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return _createItem(index);
        });
  }

  Widget _createItem(int index) {
    return GestureDetector(
      onTap: () {
        print("no_${index}");
      },
      child: Image(
        image: NetworkImage('https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}




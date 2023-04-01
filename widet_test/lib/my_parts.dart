import 'package:flutter/material.dart';

class MyParts extends StatelessWidget {
  const MyParts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://pbs.twimg.com/media/FWKe6wTUUAAluDJ?format=jpg&name=medium")),

        // 枠線
        border: Border.all(color: Colors.blue, width: 2),
        // 角丸
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('border'),
    );
  }
}

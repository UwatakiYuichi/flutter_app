import 'package:flutter/material.dart';

class MyIndicator extends StatefulWidget {
  const MyIndicator({super.key});

  @override
  State<MyIndicator> createState() => _MyIndicatorState();
}

class _MyIndicatorState extends State<MyIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 重ねる位置を指定
      children: [
        Container(
          margin: EdgeInsets.all(0.0),
          color: Color.fromARGB(128, 0, 0, 0),
          height: double.infinity,
        ),
        CircularProgressIndicator(
          color: Colors.white,
        ),
      ],
    );
  }
}

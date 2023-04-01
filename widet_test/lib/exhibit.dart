import 'package:flutter/material.dart';

class Exhibit extends StatefulWidget {
  const Exhibit({super.key});

  @override
  State<Exhibit> createState() => _ExhibitState();
}

class _ExhibitState extends State<Exhibit> {
  @override
  void initState() {
    super.initState();
    print("出品");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("出品"),
          ],
        ),
      ),
    );
  }
}

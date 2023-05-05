import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widet_test/home/carousel_slider.dart';
import 'package:widet_test/home/slider_new.dart';

import '../grid_view_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderNew(listImages: [
          "lib/assets/images/raisu1.jpg",
          "lib/assets/images/raisu2.jpg",
        ]),
        Container(
          alignment: Alignment(0, -1),
          color: Color.fromARGB(255, 252, 183, 206),
          height: 200,
          width: 400,
          child: Text("隙間"),
        ),
        Expanded(child: GriViewBuilder())
      ],
    );
  }
}

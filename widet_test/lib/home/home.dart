import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widet_test/common/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 1, 119, 83), child: CarouselSliderParts());
  }
}
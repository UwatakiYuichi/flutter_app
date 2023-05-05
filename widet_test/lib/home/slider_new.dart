import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderNew extends StatefulWidget {
  final List listImages;
  const SliderNew({Key? key, required this.listImages}) : super(key: key);

  @override
  State<SliderNew> createState() => _SliderNewState();
}

class _SliderNewState extends State<SliderNew> {
  late List listImages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listImages = widget.listImages;
  }

// バナーイメージを作成する
  Widget buildImage(path, index) => Container(
        //画像間の隙間
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.green,

        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(child: buildImage(listImages[0], 0));
  }
}

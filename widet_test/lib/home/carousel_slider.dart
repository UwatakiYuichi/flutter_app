import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../grid_view_builder.dart';

class CarouselSliderParts extends StatefulWidget {
  // コンストラクタ
  const CarouselSliderParts({super.key});

  @override
  State<CarouselSliderParts> createState() => _CarouselSliderPartsState();
}

class _CarouselSliderPartsState extends State<CarouselSliderParts> {
  final images = [
    "lib/assets/images/raisu1.jpg",
    "lib/assets/images/raisu2.jpeg",
    "lib/assets/images/raisu3.jpeg",
  ];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Container(
                child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  // height: 400,
                  height: 30,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) => setState(() {
                    activeIndex = index;
                  }),
                ),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final path = images[index];
                  return buildImage(path, index);
                },
              ),
              SizedBox(height: 10),
              // buildIndicator()
              Container(
                width: double.infinity,
                height: 900,
                child: GriViewBuilder(),
                color: Color.fromARGB(255, 0, 95, 73),
              )
            ],
          ),
        ))),
      );

  Widget buildImage(path, index) => Container(
        //画像間の隙間
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.green,

        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        //エフェクトはドキュメントを見た方がわかりやすい
        effect: JumpingDotEffect(
            dotHeight: 20,
            dotWidth: 20,
            activeDotColor: Colors.green,
            dotColor: Colors.black12),
      );
}

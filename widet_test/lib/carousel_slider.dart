import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatefulWidget {
  // コンストラクタ
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  // height: 400,
                  height: 600,
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
              SizedBox(height: 20),
              // buildIndicator()
            ],
          ),
        ),
      );

  Widget buildImage(path, index) => Container(
        //画像間の隙間
        margin: EdgeInsets.symmetric(horizontal: 13),
        color: Colors.grey,
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

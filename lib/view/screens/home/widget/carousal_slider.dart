import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/radius.dart';

class CarasoulSlider extends StatelessWidget {
  const CarasoulSlider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          width: size.width,
          height: size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: kRAdius10,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'asset/login_background.png',
              ),
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Container(
          width: size.width,
          height: size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: kRAdius10,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'asset/entry_background.png',
                ),
                filterQuality: FilterQuality.high),
          ),
        ),
      ],
      options: CarouselOptions(
          autoPlay: true,
          // viewportFraction: 10,

          enlargeCenterPage: true,
          enableInfiniteScroll: true),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/product/screen_product.dart';
import 'package:get/get.dart';

class CarasoulSlider extends StatelessWidget {
  const CarasoulSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const BuyProduct()),
      child: CarouselSlider(
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
      ),
    );
  }
}

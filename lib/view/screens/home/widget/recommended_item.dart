import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/product/screen_product.dart';
import 'package:get/get.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.7,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(const BuyProduct()),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
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
            );
          }),
    );
  }
}

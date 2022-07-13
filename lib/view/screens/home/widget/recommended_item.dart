import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home/home_controller.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/product/screen_product.dart';
import 'package:get/get.dart';

class RecommendedItem extends StatelessWidget {
  RecommendedItem({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.7,
      width: size.width,
      child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.products!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(const BuyProduct()),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width,
                height: size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: kRAdius10,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'http://54.176.6.232/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg',
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

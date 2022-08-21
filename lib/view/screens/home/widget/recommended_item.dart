import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
import 'package:get/get.dart';

class RecommendedItem extends StatelessWidget {
  RecommendedItem({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: size.width * 0.6,
        width: size.width,
        child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            // shrinkWrap: true,
            itemCount: controller.products!.length < 4
                ? controller.products!.length
                : 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(BuyProduct(
                  products: controller.products![index],
                )),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                  color: kWhiteColor,
                  child: FadeInImage.assetNetwork(
                      width: size.width,
                      height: size.width * .4,
                      placeholder: 'asset/noimage.jpeg',
                      image:
                          'http://10.0.2.2:3000/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                ),
              );
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home/home_controller.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/screens/product/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.67,
      width: size.width,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemCount: controller.products!.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                child: GestureDetector(
                  onTap: () => Get.to(
                    const BuyProduct(),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: size.width * 0.45,
                        height: size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'http://54.176.6.232/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: size.width * 0.45,
                        height: size.width * 0.24,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemText(
                                  name: controller.products![index].category,
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kGreyColor),
                              ItemText(
                                  name: controller.products![index].name,
                                  weight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBlackColor),
                              Row(
                                children: [
                                  ItemText(
                                      name: controller.products![index].price,
                                      weight: FontWeight.normal,
                                      fontSize: 20,
                                      color: kredColor),
                                  ItemText(
                                      strike: TextDecoration.lineThrough,
                                      name: controller
                                          .products![index].originalPrice,
                                      weight: FontWeight.normal,
                                      fontSize: 17,
                                      color: kBlack54Color)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

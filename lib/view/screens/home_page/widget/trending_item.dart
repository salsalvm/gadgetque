import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/screens/product_page/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.77,
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
                     BuyProduct(products:controller.products![index]),
                  ),
                  child: Column(
                    children: [
                               FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              width: size.width * .5,
                              height: size.width * .5,
                              placeholder: 'asset/noimage.jpeg',
                              image:
                                  'http://10.0.2.2:3000/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       'http://54.176.6.232/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg',
                      //   width: size.width * .5,
                      //   height: size.width * .5,
                      //   placeholder: (context, url) =>
                      //       const Center(child: CircularProgressIndicator()),
                      //   errorWidget: (context, str, error) =>
                      //       CachedNetworkImage(
                      //     imageUrl:
                      //         'http://10.0.2.2:3000/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg',
                      //     width: size.width * .5,
                      //     height: size.width * .5,
                      //     placeholder: (context, url) =>
                      //         const Center(child: CircularProgressIndicator()),
                      //     errorWidget: (context, str, error) => const Icon(
                      //       Icons.error,
                      //       color: kGreyColor,
                      //       size: 40,
                      //     ),
                      //   ),
                      // ),
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
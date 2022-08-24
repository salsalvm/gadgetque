import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/ratting_item.dart';
import 'package:get/get.dart';

class MostRattedItem extends StatelessWidget {
  const MostRattedItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.83,
      width: size.width,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.products == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.products!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                      BuyProduct(
                        products: controller.products![index],
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                      color: kWhiteColor,
                      child: Column(
                        children: [
                          FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              width: size.width * .5,
                              height: size.width * .5,
                              placeholder: 'asset/noimage.jpeg',
                              image:
                                  'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: size.width * 0.45,
                            height: size.width * 0.3,
                            decoration: const BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      name:
                                          controller.products![index].category,
                                      weight: FontWeight.w500,
                                      fontSize: 18,
                                      color: kGreyColor),
                                  CustomText(
                                      name: controller.products![index].name,
                                      weight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kBlackColor),
                                  Row(
                                    children: [
                                      CustomText(
                                          name:
                                              controller.products![index].price,
                                          weight: FontWeight.normal,
                                          fontSize: 20,
                                          color: kredColor),
                                      CustomText(
                                          strike: TextDecoration.lineThrough,
                                          name: controller
                                              .products![index].originalPrice,
                                          weight: FontWeight.normal,
                                          fontSize: 17,
                                          color: kBlack54Color),
                                    ],
                                  ),
                                  kHeigt5,
                                  const RattingItems()
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

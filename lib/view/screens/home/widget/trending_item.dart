import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
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
        builder: (controller) => controller.products == null
            ? const Center(child: CupertinoActivityIndicator()):
        ListView.builder(
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
                    BuyProduct(products: controller.products![index]),
                  ),
                  child: Column(
                    children: [
                           CachedNetworkImage(
                            imageUrl:
                                'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg',
                            width: size.width * .5,
                            height: size.width * .5,
                            placeholder: (context, url) => Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('asset/noimage.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            errorWidget: (context, str, error) =>
                                 SizedBox(
                              width: size.width * .2,
                              child:const CustomText(
                                  lines: 3,
                                  name:
                                      'No Internet please connect a valid wife',
                                  weight: FontWeight.normal,
                                  fontSize: 18,
                                  color: kGreyColor),
                            ),
                          ),
                      // FadeInImage.assetNetwork(
                      //     fit: BoxFit.fill,
                      //     width: size.width * .5,
                      //     height: size.width * .5,
                      //     placeholder: 'asset/noimage.jpeg',
                      //     image:
                      //         'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
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
                              CustomText(
                                  name: controller.products![index].category,
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
                                      name: controller.products![index].price,
                                      weight: FontWeight.normal,
                                      fontSize: 20,
                                      color: kredColor),
                                  CustomText(
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

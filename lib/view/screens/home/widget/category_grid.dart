import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/category_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/category_view_page/sceen_category_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) => controller.categoryItems == null
          ? const Center(
              child: CupertinoActivityIndicator(
              color: Colors.teal,
            ))
          : controller.categoryItems!.isEmpty
              ? const CustomText(
                  name: 'No Product In this Category',
                  weight: FontWeight.normal,
                  fontSize: 16,
                  color: kGreyColor)
              : GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                  itemCount: controller.categoryItems!.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.75,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(
                        BuyCategoryProduct(
                          products: controller.categoryItems![index],
                        ),
                      ),
                      child: Card(
                        color: kWhiteColor,
                        shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'http://34.238.154.28/product-image/${controller.categoryItems![index].id}/${controller.categoryItems![index].imageId}_1.jpg',
                                    width: size.width * .5,
                                    height: size.width * .45,
                                    placeholder: (context, url) => Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'asset/noimage.jpeg'),
                                              fit: BoxFit.cover)),
                                    ),
                                    errorWidget: (context, str, error) =>
                                        SizedBox(
                                      width: size.width * .2,
                                      child: const CustomText(
                                          lines: 3,
                                          name:
                                              'No Internet please connect a valid wifi',
                                          weight: FontWeight.normal,
                                          fontSize: 18,
                                          color: kGreyColor),
                                    ),
                                  ),
                                  // FadeInImage.assetNetwork(
                                  //     fit: BoxFit.fill,
                                  //     width: size.width * .5,
                                  //     height: size.width * .45,
                                  //     placeholder: 'asset/noimage.jpeg',
                                  //     image:
                                  //         'http://34.238.154.28/product-image/${controller.categoryItems![index].id}/${controller.categoryItems![index].imageId}_1.jpg'),
                                ],
                              ),
                              kHeigt5,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      name: controller
                                          .categoryItems![index].name!
                                          .toUpperCase(),
                                      weight: FontWeight.bold,
                                      fontSize: 18,
                                      color: kBlackColor),
                                  SizedBox(
                                    child: CustomText(
                                        lines: 2,
                                        spacing: 1.2,
                                        name: controller
                                            .categoryItems![index].description!,
                                        weight: FontWeight.w400,
                                        fontSize: 16,
                                        color: kBlack54Color),
                                  ),
                                  CustomText(
                                      name: controller
                                          .categoryItems![index].category!,
                                      weight: FontWeight.w500,
                                      fontSize: 20,
                                      color: kBlackColor),
                                  Row(
                                    children: [
                                      CustomText(
                                          name: controller
                                              .categoryItems![index].price!,
                                          weight: FontWeight.bold,
                                          fontSize: 22,
                                          color: kGreenColor),
                                      kWidth5,
                                      CustomText(
                                          name: controller.categoryItems![index]
                                              .originalPrice!,
                                          weight: FontWeight.w400,
                                          fontSize: 20,
                                          strike: TextDecoration.lineThrough,
                                          color: kBlack54Color),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

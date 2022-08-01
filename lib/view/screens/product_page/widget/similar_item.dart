import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';
import 'package:get/get.dart';

class SimilarItem extends StatelessWidget {
  const SimilarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 1.14,
      color: kBoxColor,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.categoryItems == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      controller.getCategoryDatas(
                          controller.categories![index].category);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: size.width * 0.85,
                              width: size.width * .89,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: kRAdius10,
                              ),
                              child: FadeInImage.assetNetwork(
                                  width: size.width * .85,
                                  height: size.width * .89,
                                  placeholder: 'asset/noimage.jpeg',
                                  image:
                                      'http://10.0.2.2:3000/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: AddWishlist(),
                            )
                          ],
                        ),
                        kHeigt5,
                        ItemText(
                            name: controller.products![index].category,
                            weight: FontWeight.w500,
                            fontSize: 18,
                            color: kBlack54Color),
                        ItemText(
                            name: controller.products![index].name,
                            weight: FontWeight.w500,
                            fontSize: 22,
                            color: kBlack54Color),
                        kHeigt5,
                        Row(
                          children: [
                            ItemText(
                                name: controller.products![index].price,
                                weight: FontWeight.bold,
                                fontSize: 22,
                                color: kGreenColor),
                            kWidth5,
                            ItemText(
                              name: controller.products![index].originalPrice,
                              weight: FontWeight.w500,
                              fontSize: 20,
                              color: kBlack54Color,
                              strike: TextDecoration.lineThrough,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.products!.length,
              ),
      ),
    );
  }
}

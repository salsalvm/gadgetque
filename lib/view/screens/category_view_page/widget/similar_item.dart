import 'package:gadgetque/controller/category_controller.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class CatSimilarItem extends StatelessWidget {
   CatSimilarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 1.14,
      color: kBoxColor,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => catController.categoryItems == null
            ? const Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      catController.getCategoryDatas(
                          controller.categories![index].category);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
                        ),
                        kHeigt5,
                        CustomText(
                            name: controller.products![index].category,
                            weight: FontWeight.w500,
                            fontSize: 18,
                            color: kBlack54Color),
                        CustomText(
                            name: controller.products![index].name,
                            weight: FontWeight.w500,
                            fontSize: 22,
                            color: kBlack54Color),
                        kHeigt5,
                        Row(
                          children: [
                            CustomText(
                                name: controller.products![index].price,
                                weight: FontWeight.bold,
                                fontSize: 22,
                                color: kGreenColor),
                            kWidth5,
                            CustomText(
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
  final catController = Get.put(CategoryController());
}

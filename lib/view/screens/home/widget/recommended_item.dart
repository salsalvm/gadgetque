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

class RecomentedItems extends StatelessWidget {
  const RecomentedItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => controller.products == null
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.teal,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: size.width * 0.6,
                width: size.width,
                child: ListView.builder(
                    shrinkWrap: true,
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
                          shape:
                              RoundedRectangleBorder(borderRadius: kRAdius10),
                          color: kWhiteColor,
                          child: CachedNetworkImage(
                            imageUrl:
                                'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg',
                            width: size.width,
                            height: size.width * .4,
                            placeholder: (context, url) => Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('asset/noimage.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            errorWidget: (context, str, error) => SizedBox(
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
                        ),
                      );
                    }),
              ),
            ),
    );
  }
}

 //  FadeInImage.assetNetwork(
                  //     width: size.width,
                  //     height: size.width * .4,
                  //     placeholder: 'asset/noimage.jpeg',
                  //     image:
                  //         'http://34.238.154.28/product-image/${controller.products![index].id}/${controller.products![index].imageId}_1.jpg'),
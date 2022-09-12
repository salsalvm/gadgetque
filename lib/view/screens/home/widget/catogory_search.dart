import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/category_controller.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatogorySearch extends StatelessWidget {
   CatogorySearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.63,
      width: size.width,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.categories == null
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.categories!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      catController.getCategoryDatas(
                          controller.categories![index].category);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                      child: Column(
                        children: [
                          // FadeInImage.assetNetwork(
                          //     fit: BoxFit.fill,
                          //     width: size.width * .5,
                          //     height: size.width * .5,
                          //     placeholder: 'asset/noimage.jpeg',
                          //     image:
                          //         'http://34.238.154.28/category-image/${controller.categories![index].id}.jpg'),
                          CachedNetworkImage(
                            imageUrl:
                                'http://34.238.154.28/category-image/${controller.categories![index].id}.jpg',
                            width: size.width * .5,
                            height: size.width * .5,
                            placeholder: (context, url) => Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('asset/noimage.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            errorWidget: (context, str, error) => SizedBox(
                              width: size.width * .2,
                              child: const Center(
                                child: CustomText(
                                    lines: 3,
                                    name:
                                        'No Internet please connect a valid wifi',
                                    weight: FontWeight.normal,
                                    fontSize: 18,
                                    color: kGreyColor),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: size.width * 0.4,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                controller.categories![index].category,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
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
  }final catController=Get.put(CategoryController());
}

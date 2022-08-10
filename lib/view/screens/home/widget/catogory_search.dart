import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
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
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.categories!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.getCategoryDatas(
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
                          //         'http://10.0.2.2:3000/category-image/${controller.categories![index].id}.jpg'),
                          CachedNetworkImage(
                            imageUrl:
                                'http://18.144.34.178/category-image/${controller.categories![index].id}.jpg',
                            width: size.width * .5,
                            height: size.width * .5,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, str, error) =>
                                CachedNetworkImage(
                              imageUrl:
                                  'http://10.0.2.2:3000/category-image/${controller.categories![index].id}.jpg',
                              width: size.width * .5,
                              height: size.width * .5,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, str, error) => const Icon(
                                Icons.error,
                                color: kGreyColor,
                                size: 40,
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
  }
}

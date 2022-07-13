import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home/home_controller.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:get/get.dart';

class CatogorySearch extends StatelessWidget {
  CatogorySearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.59,
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
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: size.width * 0.4,
                            height: size.width * 0.45,
                            decoration: BoxDecoration(
                              color: kFormColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'http://54.176.6.232/category-image/${controller.categories![index].id}.jpg',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: size.width * 0.4,
                            height: size.width * 0.1,
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

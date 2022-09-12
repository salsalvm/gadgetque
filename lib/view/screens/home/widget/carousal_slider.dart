import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class CarasoulSlider extends StatelessWidget {
  const CarasoulSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.products == null
            ? const Center(child: CupertinoActivityIndicator())
            : CarouselSlider(
                items: [
                  CourasalList(
                      image:
                          'http://34.238.154.28/product-image/${controller.products![0].id}/${controller.products![0].imageId}_2.jpg'),
                  CourasalList(
                      image:
                          'http://34.238.154.28/product-image/${controller.products![1].id}/${controller.products![1].imageId}_1.jpg'),
                  CourasalList(
                      image:
                          'http://34.238.154.28/product-image/${controller.products![0].id}/${controller.products![0].imageId}_3.jpg'),
                  CourasalList(
                      image:
                          'http://34.238.154.28/product-image/${controller.products![4].id}/${controller.products![4].imageId}_1.jpg')
                ],
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true),
              ),
      ),
    );
  }
}

class CourasalList extends StatelessWidget {
  final String image;
  const CourasalList({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
          // FadeInImage.assetNetwork(
          //     fit: BoxFit.fill,
          //     width: size.width,
          //     height: size.width * 0.6,
          //     placeholder: 'asset/noimage.jpeg',
          //     image: image),
          CachedNetworkImage(
        imageUrl: image,
        width: size.width,
        height: size.width * .06,
        placeholder: (context, url) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/noimage.jpeg'), fit: BoxFit.cover)),
        ),
        errorWidget: (context, str, error) => SizedBox(
          width: size.width * .2,
          child: const CustomText(
              lines: 3,
              name: 'No Internet please connect a valid wifi',
              weight: FontWeight.normal,
              fontSize: 18,
              color: kGreyColor),
        ),
      ),
    );
  }
}

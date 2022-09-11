import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
class CatProductImage extends StatelessWidget {
  CatProductImage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Prodatum products;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'http://34.238.154.28/product-image/${products.id}/${products.imageId}_1.jpg',
      width: size.width,
      height: size.width * .89,
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
            name: 'No Internet please connect a valid wife',
            weight: FontWeight.normal,
            fontSize: 18,
            color: kGreyColor),
      ),
    );
  }
}

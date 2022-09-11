import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class SearchResult extends StatelessWidget {
  final int index;
  const SearchResult({
    Key? key,
    required this.searched,
    required this.index,
  }) : super(key: key);

  final List<Product> searched;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: kRAdius10),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'http://34.238.154.28/product-image/${searched[index].id}/${searched[index].imageId}_1.jpg',
              width: size.width * .5,
              height: size.width * .45,
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
            ),
            kHeigt5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: CustomText(
                      lines: 2,
                      name: searched[index].name,
                      weight: FontWeight.w500,
                      fontSize: 18,
                      color: kBlackColor),
                ),
                kHeigt5,
                CustomText(
                    name: searched[index].description,
                    weight: FontWeight.w500,
                    fontSize: 16,
                    color: kBlack54Color),
                Row(
                  children: [
                    CustomText(
                        name: searched[index].price,
                        weight: FontWeight.bold,
                        fontSize: 20,
                        color: kGreenColor),
                    CustomText(
                        strike: TextDecoration.lineThrough,
                        name: searched[index].originalPrice,
                        weight: FontWeight.normal,
                        fontSize: 17,
                        color: kBlack54Color),
                  ],
                ),
                const CustomText(
                    name: 'free delivery',
                    weight: FontWeight.w500,
                    fontSize: 18,
                    color: kBlack54Color)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

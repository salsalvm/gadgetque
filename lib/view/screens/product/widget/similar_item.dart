import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist/widget/add_wishlists.dart';

class SimilarItem extends StatelessWidget {
  const SimilarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 1.14,color: kBoxColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 20),
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
                      image: const DecorationImage(
                        image: AssetImage(
                          'asset/mobile.png',
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AddWishlist(),
                  )
                ],
              ),
              kHeigt5,
              const ItemText(
                  name: 'MOBILE',
                  weight: FontWeight.w500,
                  fontSize: 18,
                  color: kBlack54Color),
              const ItemText(
                  name: 'Iphone 13 Pro Max',
                  weight: FontWeight.w500,
                  fontSize: 22,
                  color: kBlack54Color),
              kHeigt5,
              Row(
                children: [
                  ItemText(
                      name: '€90,000',
                      weight: FontWeight.bold,
                      fontSize: 22,
                      color: kGreenColor),
                  kWidth5,
                  const ItemText(
                    name: '€1,00,020',
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
        itemCount: 4,
      ),
    );
  }
}

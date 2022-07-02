import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/product/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist/widget/add_wishlists.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1 / 1.75,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Get.to(const BuyProduct()),
          child: Card(
            color: kWhiteColor,
            shape: RoundedRectangleBorder(borderRadius: kRAdius10),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        width: size.width * .5,
                        height: size.width * .45,
                        decoration: BoxDecoration(
                          borderRadius: kRAdius10,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'asset/mobile.png',
                            ),
                          ),
                        ),
                      ),
                     const AddWishlist(radius: 20,iconSize: 34),
                    ],
                  ),
                  kHeigt5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        child: ItemText(
                            lines: 2,
                            name:
                                'Smart Phone Apple Dual core Fully  Watter proof',
                            weight: FontWeight.w500,
                            fontSize: 18,
                            color: kBlackColor),
                      ),
                      kHeigt5,
                      const ItemText(
                          name: 'Apple',
                          weight: FontWeight.w500,
                          fontSize: 16,
                          color: kBlack54Color),
                      ItemText(
                          name: '€40,000',
                          weight: FontWeight.bold,
                          fontSize: 20,
                          color: kGreenColor),
                      const ItemText(
                          name: 'free delivery',
                          weight: FontWeight.w500,
                          fontSize: 18,
                          color: kBlack54Color)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

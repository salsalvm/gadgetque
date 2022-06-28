import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/buy_product/screen_buy_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        const BuyProduct(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * .46,
                  child: const ItemText(
                      lines: 2,
                      name: 'Smart Watch  Apple Dual core Fully Wa',
                      weight: FontWeight.w700,
                      fontSize: 20,
                      color: kBlackColor),
                ),
                kHeigt5,
                const ItemText(
                    name: 'Apple 6',
                    weight: FontWeight.bold,
                    fontSize: 18,
                    color: kBlack54Color),
                const ItemText(
                    name: 'seller :   Apple Inc.',
                    weight: FontWeight.bold,
                    fontSize: 18,
                    color: kBlack54Color),
                kHeigt5,
                ItemText(
                    name: '€30,000',
                    weight: FontWeight.bold,
                    fontSize: 24,
                    color: kGreenColor)
              ],
            ),
            Container(
              width: size.width * .36,
              height: size.width * .36,
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
          ],
        ),
      ),
    );
  }
}

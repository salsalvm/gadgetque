
import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: kBoxColor, borderRadius: kRAdius10),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .5,
                      child: const ItemText(
                          lines: 2,
                          name:
                              'Smart Watch  Apple Dual core Fully Watch',
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
                  width: size.width * .35,
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
            kHeigt5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ItemText(
                    name: 'Delivery By Thu Jan 21',
                    weight: FontWeight.bold,
                    fontSize: 18,
                    color: kBlackColor),
                ActionButton(
                    radius: 10,
                    fontSize: 20,
                    buttonWidth: size.width * .35,
                    buttonHeight: size.width * .09,
                    text: 'Qty : 1  ▼',
                    onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

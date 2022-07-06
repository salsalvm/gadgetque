import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class DeliveryTo extends StatelessWidget {
  const DeliveryTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: kRAdius10, color: kBoxColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ItemText(
                    name: 'Delivery To  :',
                    weight: FontWeight.bold,
                    fontSize: 20,
                    color: kBlackColor),
                ActionButton(
                    buttonWidth: size.width * .1,
                    buttonHeight: size.width * .08,
                    radius: 5,
                    text: 'CHANGE',
                    fontColor: kWhiteColor,
                    fontSize: 16,
                    onTap: () {})
              ],
            ),
            const DivLine(),
            const ItemText(
                name: 'Salsal vm',
                weight: FontWeight.bold,
                fontSize: 20,
                color: kBlackColor),
            kHeigt5,
            Row(
              children: const [
                ItemText(
                    name: 'Muchukunnu ,',
                    weight: FontWeight.w500,
                    fontSize: 16,
                    color: kBlack54Color),
                ItemText(
                    name: 'Koyilandy ,',
                    weight: FontWeight.w500,
                    fontSize: 16,
                    color: kBlack54Color),
              ],
            ),
            Row(
              children: const [
                ItemText(
                    name: 'Kozhikode ,',
                    weight: FontWeight.w500,
                    fontSize: 16,
                    color: kBlack54Color),
                ItemText(
                    name: 'Kerala',
                    weight: FontWeight.w500,
                    fontSize: 16,
                    color: kBlack54Color),
              ],
            ),
            kHeigt5,
            const ItemText(
                name: '673307',
                weight: FontWeight.w500,
                fontSize: 16,
                color: kBlack54Color),
            const ItemText(
                name: '+91 7558959094',
                weight: FontWeight.w700,
                fontSize: 16,
                color: kBlackColor)
          ],
        ),
      ),
    );
  }
}

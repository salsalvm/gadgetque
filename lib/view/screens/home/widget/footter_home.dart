
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class FootterHome extends StatelessWidget {
  const FootterHome({
    Key? key,
   
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.54,
      color: kBoxColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [kHeigt20,
          const  EntryAppbar(iconColor: kBlackColor, textColor: kBlackColor),
          kHeigt30,
            const ItemText(
                name: 'Salsal',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            kHeigt5,
            const ItemText(
                name: 'Calicut',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlack54Color),
            const ItemText(
                name: 'Kerala',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlack54Color),
            const ItemText(
                name: 'India',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlack54Color),
            const ItemText(
                name: '+91 7558959094',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlack54Color),
            kHeigt20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ItemText(
                        name: 'Use Link',
                        weight: FontWeight.bold,
                        fontSize: 22,
                        color: kBlackColor),
                    kHeigt5,
                    ItemText(
                        name: 'About GadgetQue',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'How to shop',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'FAQ',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Contact Us',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Log In',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ItemText(
                        name: 'Costomer Services',
                        weight: FontWeight.bold,
                        fontSize: 22,
                        color: kBlackColor),
                    kHeigt5,
                    ItemText(
                        name: 'Payment Method',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Return',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Shipping',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Terms & Conditions ',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                    ItemText(
                        name: 'Privacy Policy',
                        weight: FontWeight.bold,
                        fontSize: 18,
                        color: kBlack54Color),
                  ],
                ),
              ],
            )
           
          ],
        ),
      ),
    );
  }
}

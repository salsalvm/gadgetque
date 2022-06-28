import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({
    Key? key,
  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBoxColor,
      height: size.width * 0.55,
      width: size.width,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeigt5,
            const TextElementsInRow(
                firstText: 'Cart Total         :',
                secondText: '€14,000',
                fontColor: kBlackColor,
                fontSize: 22,
                wieght: FontWeight.bold),
            
            const DivLine(),
            kHeigt5,
            const TextElementsInRow(
                firstText: 'Sub Total            :',
                secondText: '€14,000',
                wieght: FontWeight.w500,
                fontSize: 20,
                fontColor: kBlack54Color),
            kHeigt5,
            const TextElementsInRow(
                firstText: 'Delivey Charge     :',
                secondText: '€40',
                wieght: FontWeight.w500,
                fontSize: 18,
                fontColor: kBlack54Color),
            
            const DivLine(),
            const TextElementsInRow(
                firstText: 'Total               :',
                secondText: '€14,040',
                wieght: FontWeight.bold,
                fontSize: 24,
                fontColor: kBlackColor),
            kHeigt10,
            ActionButton(
              onTap: () {},
              buttonWidth: size.width,
              buttonHeight: size.width * 0.128,
              text: 'Proceed To Checkout',
            ),
          ],
        ),
      ),
    );
  }
}

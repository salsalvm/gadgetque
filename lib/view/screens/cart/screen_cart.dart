import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_container.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_items_list.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(
          title: 'My Cart',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            kHeigt10,
            CartContainer(size: size),
            const MainHead(headding: 'Cart Items', top: 20),
            const DivLine(),
            CartitemsList(size: size),
            Container(
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
                    kHeigt5,
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
                    kHeigt5,
                    const DivLine(),
                    const TextElementsInRow(
                        firstText: 'Total               :',
                        secondText: '€14,040',
                        wieght: FontWeight.bold,
                        fontSize: 24,
                        fontColor: kBlackColor),
                    kHeigt10,
                    ActionButtonClient(
                      onTap: () {},
                      buttonWidth: size.width,
                      buttonHeight: size.width * 0.128,
                      text: 'Proceed To Checkout',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

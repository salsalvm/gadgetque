import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.27,
        color: kWhiteColor,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomText(
                name: 'Shopping Cart',
                weight: FontWeight.bold,
                fontSize: 28,
                color: kBlackColor),
            CustomText(
                name: 'Shop',
                weight: FontWeight.normal,
                fontSize: 24,
                color: kBlueColor)
          ],
        ),
      ),
    );
  }
}

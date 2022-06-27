import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.27,
      color: kBoxColor,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ItemText(
              name: 'Shopping Cart',
              weight: FontWeight.bold,
              fontSize: 28,
              color: kBlackColor),
          ItemText(
              name: 'Shop',
              weight: FontWeight.normal,
              fontSize: 24,
              color: kBlueColor)
        ],
      ),
    );
  }
}

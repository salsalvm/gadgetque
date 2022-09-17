import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.3,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: GetBuilder<CartController>(
          init: CartController(),
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeigt5,
              TextElementsInRow(
                  firstText: 'Sub Total            :',
                  secondText:
                      controller.total == null ? "0.00" : '${controller.total}',
                  wieght: FontWeight.w500,
                  fontSize: 20,
                  fontColor: kBlack54Color),
              kHeigt5,
              const TextElementsInRow(
                  firstText: 'Delivey Charge     :',
                  secondText: '0.00',
                  wieght: FontWeight.w500,
                  fontSize: 18,
                  fontColor: kBlack54Color),
              kHeigt5,
              const DivLine(),
              kHeigt5,
              TextElementsInRow(
                  firstText: 'Cart Total      :',
                  secondText:
                      controller.total == null ? "0.00" : '${controller.total}',
                  wieght: FontWeight.bold,
                  fontSize: 24,
                  fontColor: kBlackColor),
              kHeigt5,
            ],
          ),
        ),
      ),
    );
  }
}

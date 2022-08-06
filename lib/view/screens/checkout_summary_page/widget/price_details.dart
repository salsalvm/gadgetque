import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';
import 'package:get/get.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
      builder: (controller) => Container(
        decoration: BoxDecoration(color: kBoxColor, borderRadius: kRAdius10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ItemText(
                  name: 'Price Details',
                  weight: FontWeight.bold,
                  fontSize: 22,
                  color: kBlackColor),
              kHeigt5,
              const DivLine(),
              kHeigt5,
              TextElementsInRow(
                  firstText: 'Price                           :',
                  secondText: '${controller.total ?? '0.00'}',
                  wieght: FontWeight.w500,
                  fontSize: 18,
                  fontColor: kBlack54Color),
              kHeigt5,
              const TextElementsInRow(
                  firstText: 'Delivery Charge        :',
                  secondText: '0.00',
                  wieght: FontWeight.w500,
                  fontSize: 18,
                  fontColor: kBlack54Color),
              kHeigt5,
              const DivLine(),
              kHeigt10,
              TextElementsInRow(
                  firstText: 'Amount Payable   :',
                  secondText: '${controller.total ?? '0.00'}',
                  wieght: FontWeight.bold,
                  fontSize: 22,
                  fontColor: kBlackColor),
            ],
          ),
        ),
      ),
    );
  }
}

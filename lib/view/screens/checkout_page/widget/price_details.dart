import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
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
        builder: (controller) {
       double discount=   controller.offer*controller.total/100;
       String disc=discount.toString();
       
          return Container(
            decoration:
                BoxDecoration(color: kBoxColor, borderRadius: kRAdius10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      name: 'Price Details',
                      weight: FontWeight.bold,
                      fontSize: 22,
                      color: kBlackColor),
                  kHeigt5,
                  const DivLine(),
                  kHeigt5,
                  TextElementsInRow(
                      firstText: 'Price                           :',
                      secondText: '${controller.total}',
                      wieght: FontWeight.w500,
                      fontSize: 20,
                      fontColor: kBlack54Color),
                  kHeigt5,
                   TextElementsInRow(
                      firstText: 'Coupon Discount      :',
                      secondText: '- $disc',
                      wieght: FontWeight.w500,
                      fontSize: 16,
                      fontColor: kBlack54Color),
                  kHeigt5,
                  const DivLine(),
                  kHeigt10,
                  TextElementsInRow(
                      firstText: 'Amount Payable   :',
                      
                      secondText: '${controller.total-discount}',
                      wieght: FontWeight.bold,
                      fontSize: 22,
                      fontColor: kBlackColor),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kBoxColor, borderRadius: kRAdius10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
                name: 'Payment Methods',
                weight: FontWeight.bold,
                fontSize: 22,
                color: kBlackColor),
            const DivLine(),
            Payment(name: 'Razor Pay'),
            Payment(name: 'COD')
          ],
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  final String name;

  Payment({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
      builder: (controller) => RadioListTile(
        title: CustomText(
            name: name,
            weight: FontWeight.w500,
            fontSize: 22,
            color: kBlackColor),
        value: name,
        groupValue: controller.selectMethod,
        onChanged: (value) {
          controller.selectRadioButton(value.toString());
          controller.update();
        },
      ),
    );
  }
}

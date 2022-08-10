import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class CouponApply extends StatelessWidget {
  CouponApply({
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
            const ItemText(
                name: 'COUPON',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            const DivLine(),
            kHeigt5,
            FormFields(
              controller: couponController,
              validator: (value) {},
              icon: Icons.earbuds_rounded,
              fontSize: 20,
              size: 18,
              name: 'voucher code exp:(OFFA20)',
              color: Colors.white.withOpacity(.3),
            ),
            kHeigt5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                    buttonWidth: 120,
                    buttonHeight: 40,
                    text: 'Cancel',
                    fontColor: kWhiteColor,
                    onTap: () {}),
                ActionButton(
                    buttonWidth: 120,
                    buttonHeight: 40,
                    fontColor: kWhiteColor,
                    text: 'Apply',
                    onTap: () {
                      checkController.appyCoupon(
                        couponController.text.toString().toUpperCase(),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  final couponController = TextEditingController();
  final checkController = Get.put(CheckoutController());
}

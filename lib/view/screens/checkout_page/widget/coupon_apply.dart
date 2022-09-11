import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';


String? coupons;

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
            const CustomText(
                name: 'COUPON',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            const DivLine(),
            kHeigt5,
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => controller.coupon == null
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.teal,
                      ),
                    )
                  : DropdownButton(
                      itemHeight: 50,
                      isDense: true,
                      iconSize: 30,
                      isExpanded: true,
                      elevation: 0,
                      alignment: Alignment.centerLeft,
                      hint: const Text(
                        '     select one coupon',
                        style: TextStyle(color: kBlack54Color),
                      ),
                      value: coupons,
                      items: controller.coupon!.map(
                        (value) {
                          return DropdownMenuItem<String>(
                              value: value.coupon,
                              child: Text(
                                '    ${value.coupon}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ));
                        },
                      ).toList(),
                      onChanged: (value) async {
                        coupons = value.toString();
                        controller.update();
                      },
                    ),
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
                        coupons!.toUpperCase().trim(),
                      );
                      checkController.update();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  final checkController = Get.put(CheckoutController());
}

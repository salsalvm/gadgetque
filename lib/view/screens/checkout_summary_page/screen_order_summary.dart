import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/widget/coupon_apply.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/widget/delivery_item.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/widget/delivery_to.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/widget/payment_method.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/widget/price_details.dart';
import 'package:gadgetque/view/screens/widget/bottom_double_button.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScreenSummary extends StatelessWidget {
  const ScreenSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(
          title: 'Check Out Summary',
        ),
      ),
      body: SafeArea(
        child: GetBuilder<CheckoutController>(
          init: CheckoutController(),
          builder: (controller) => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView(
                  children: [
                    DeliveryTo(),
                    kHeigt10,
                    DeliveryItem(),
                    kHeigt10,
                    CouponApply(),
                    kHeigt10,
                    const PaymentMethod(),
                    kHeigt10,
                    const PriceDetails(),
                    kHeigt50
                  ],
                ),
              ),
              BottomDoubleButton(
                  secondText: 'Continue',
                  firstText: 'Cancel Order',
                  firstOnTap: () {},
                  secondOnTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}

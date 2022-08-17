import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/controller/payment_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/coupon_apply.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/delivery_item.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/delivery_to.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/payment_method.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/price_details.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenSummary extends StatelessWidget {
  ScreenSummary({Key? key}) : super(key: key);

  final paymentController = Get.put(PaymentController());
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
              ActionButton(
                  radius: 0,
                  buttonWidth: size.width,
                  buttonHeight: size.width * 0.14,
                  text: 'Place Order',
                  onTap: () {
                    if (controller.selectMethod == "Razor Pay") {
                      paymentController.razorPay();
                    } else if (controller.selectMethod == "COD") {
                      controller.placeOrder();
                    } else {
                      Get.snackbar('payment method not selectted',
                          'please select a payment method',
                          colorText: kredColor,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

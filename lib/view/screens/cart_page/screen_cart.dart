import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/cart_page/widget/cart_container.dart';
import 'package:gadgetque/view/screens/cart_page/widget/cart_items_list.dart';
import 'package:gadgetque/view/screens/cart_page/widget/cart_total_amount.dart';
import 'package:gadgetque/view/screens/checkout_page/screen_order_summary.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      backgroundColor: kBoxColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SecondAppbar(
          title: 'My Cart',
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: const [
                kHeigt10,
                CartContainer(),
                CartitemsList(),
                CartTotalAmount()
              ],
            ),
            cartController.productElemnt!.isEmpty
                ? ActionButton(
                    onTap: () {
                      Get.back();
                    },
                    radius: 0,
                    buttonWidth: size.width,
                    buttonHeight: size.width * 0.115,
                    text: 'Add  Product To Cart',
                  )
                : ActionButton(
                    onTap: () {
                      Get.to(ScreenSummary());
                    },
                    radius: 0,
                    buttonWidth: size.width,
                    buttonHeight: size.width * 0.115,
                    text: 'Proceed To Checkout',
                  ),
          ],
        ),
      ),
    );
  }

  final cartController = Get.put(CartController());
  final authController = Get.put(AuthenticationController());
}

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_container.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_items_list.dart';
import 'package:gadgetque/view/screens/cart/widget/crat_total_amount.dart';
import 'package:gadgetque/view/screens/product/summary/screen_order_summary.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
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
            ActionButton(
              onTap: () {
                Get.to(const ScreenSummary());
              },
              radius: 0,
              buttonWidth: size.width,
              buttonHeight: size.width * 0.13,
              text: 'Proceed To Checkout',
            ),
          ],
        ),
      ),
    );
  }
}

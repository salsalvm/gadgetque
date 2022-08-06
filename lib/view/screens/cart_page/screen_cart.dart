import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/cart_page/widget/cart_container.dart';
import 'package:gadgetque/view/screens/cart_page/widget/cart_items_list.dart';
import 'package:gadgetque/view/screens/cart_page/widget/crat_total_amount.dart';
import 'package:gadgetque/view/screens/checkout_summary_page/screen_order_summary.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBoxColor,
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
                Get.to( ScreenSummary());
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
}

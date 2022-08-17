import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/screens/cart_page/screen_cart.dart';
import 'package:gadgetque/view/screens/search_page/search_item.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class AppbarMain extends StatelessWidget {
  AppbarMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBoxColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 3),
                  height: size.width * 0.09,
                  width: size.width * 0.09,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'asset/logo.png',
                      ),
                    ),
                  ),
                ),
                const Text(
                  'GadgetsQue',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MySearch());
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 35,
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(ScreenCart());
                        cartController.update();
                      },
                      icon: const Icon(
                        Icons.shopping_cart_checkout,
                        size: 35,
                      ),
                    ),
                    GetBuilder<CartController>(
                      init: CartController(),
                      builder: (controller) => controller.cartCount == null
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.teal,
                            ))
                          : ItemText(
                              name: ' ${controller.cartCount}',
                              weight: FontWeight.bold,
                              fontSize: 22,
                              color: kBlueColor),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  final cartController = Get.put(CartController());
}

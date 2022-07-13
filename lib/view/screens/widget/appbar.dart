import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/cart/screen_cart.dart';
import 'package:gadgetque/view/screens/search/search_item.dart';
import 'package:get/get.dart';

class AppbarMain extends StatelessWidget {
  const AppbarMain({
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
                    fontSize: 30,
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
                IconButton(
                    onPressed: () {
                      Get.to(const ScreenCart());
                      Get.snackbar(
                          colorText: kBlackColor,
                          margin: const EdgeInsets.only(top: 50),
                          'Slide to left Remove from Cart',
                          '',
                          snackPosition: SnackPosition.TOP);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 35,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

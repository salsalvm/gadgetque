import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/cart/screen_cart.dart';
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
                  'GadgetQue',
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 35,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(const ScreenCart());
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

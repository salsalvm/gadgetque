import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/cart/screen_cart.dart';
import 'package:gadgetque/view/screens/product/summary/screen_order_summary.dart';
import 'package:gadgetque/view/screens/product/widget/image_details.dart';
import 'package:gadgetque/view/screens/product/widget/product_image.dart';
import 'package:gadgetque/view/screens/product/widget/similar_item.dart';
import 'package:gadgetque/view/screens/widget/bottom_double_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';

import 'package:get/get.dart';

class BuyProduct extends StatelessWidget {
  final Product products;
  const BuyProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SecondAppbar(
          title: products.category,
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                ProductImage(products: products),
                // kHeigt30,
                MainHead(headding: products.name, top: 20),
                const DivLine(),
                ImageDetails(products: products),
                const MainHead(
                  headding: 'You May Also Like',
                ),
                const DivLine(),
                const SimilarItem(),
                kHeigt50,
              ],
            ),
            GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) => BottomDoubleButton(
                secondText: 'Buy Now',
                firstText: controller.isAdd.value ? 'Add to Cart' : 'View Cart',
                firstOnTap: () {
                  controller.isAdd.value
                      ? controller.addCartItems(products.id)
                      : Get.to(const ScreenCart());
                },
                secondOnTap: () {
                  Get.to(const ScreenSummary());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

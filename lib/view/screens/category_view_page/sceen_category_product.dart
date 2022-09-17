import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/cart_page/screen_cart.dart';
import 'package:gadgetque/view/screens/category_view_page/widget/image_details.dart';
import 'package:gadgetque/view/screens/category_view_page/widget/product_image.dart';
import 'package:gadgetque/view/screens/product_view_page/widget/similar_item.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class BuyCategoryProduct extends StatelessWidget {
  final Prodatum products;
  BuyCategoryProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SecondAppbar(
          title: products.category!,
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                CatProductImage(products: products),
                // kHeigt30,
                MainHead(headding: products.name!, top: 20),
                const DivLine(),
                CatImageDetails(products: products),
                const MainHead(
                  headding: 'You May Also Like',
                ),
                const DivLine(),
                 SimilarItem(),
                kHeigt50,
              ],
            ),
            GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) {
                controller.checkCartItem(products.id!);

                return controller.isAdd == true
                    ? ActionButton(
                        buttonWidth: size.width,
                        buttonHeight: size.width * .14,
                        radius: 0,
                        text: 'View Cart',
                        onTap: () {
                          Get.off(ScreenCart());
                          // Get.snackbar(
                          //     'Product Alreaady in Cart', 'Please check Cart',
                          //     colorText: kredColor,
                          //     snackPosition: SnackPosition.TOP);
                          controller.update();
                        },
                      )
                    : ActionButton(
                        buttonWidth: size.width,
                        buttonHeight: size.width * .14,
                        radius: 0,
                        text: 'Add To Cart',
                        onTap: () {
                          controller.addCartItems(products.id!);
                          controller.update();
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  final authController = Get.put(AuthenticationController());
}

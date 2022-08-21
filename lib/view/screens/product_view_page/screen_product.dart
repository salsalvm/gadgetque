import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/product_view_page/widget/image_details.dart';
import 'package:gadgetque/view/screens/product_view_page/widget/product_image.dart';
import 'package:gadgetque/view/screens/product_view_page/widget/similar_item.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

String? productId;

class BuyProduct extends StatelessWidget {
  final Product products;
  BuyProduct({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    productId = products.id;
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
                builder: (controller) {
                  // controller.checkCartItem();
               
                  return controller.isAdd == true
                      ? ActionButton(
                          buttonWidth: size.width,
                          buttonHeight: size.width * .14,
                          radius: 0,
                          text: 'View Cart',
                          onTap: () {
                            Get.to(CartController());
                          })
                      : ActionButton(
                          buttonWidth: size.width,
                          buttonHeight: size.width * .14,
                          radius: 0,
                          text: 'Add To Cart',
                          onTap: () {
                            controller.addCartItems(products.id);
                          });
                })
          ],
        ),
      ),
    );
  }
}

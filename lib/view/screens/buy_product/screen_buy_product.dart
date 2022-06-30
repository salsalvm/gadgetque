import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/buy_product/summary/screen_order_summary.dart';
import 'package:gadgetque/view/screens/widget/bottom_double_button.dart';
import 'package:gadgetque/view/screens/buy_product/widget/image_details.dart';
import 'package:gadgetque/view/screens/buy_product/widget/image_item.dart';
import 'package:gadgetque/view/screens/buy_product/widget/similar_item.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class BuyProduct extends StatelessWidget {
  const BuyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(
          title: 'Mobile',
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: const [
                ImageItem(),
                // kHeigt30,
                MainHead(headding: 'Smart Phone', top: 20),
                DivLine(),
                ImageDetails(),
                MainHead(
                  headding: 'You May Also Like',
                ),
                DivLine(),
                SimilarItem(),
                kHeigt50,
              ],
            ),
            BottomDoubleButton(
                secondText: 'Buy Now',
                firstText: 'Add to Cart',
                firstOnTap: () {
                  Get.snackbar(
                      'Added succesfully', 'Product has been added to cart',
                      // colorText: kredColor,
                      snackPosition: SnackPosition.BOTTOM);
                },
                secondOnTap: () {
                  Get.to(const ScreenSummary());
                })
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:gadgetque/model/add_to_cart.dart';
import 'package:gadgetque/model/cart_get_items.dart';
import 'package:gadgetque/model/remove_cart.dart';
import 'package:gadgetque/model/services/cart_service.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/cart/screen_cart.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var isAdd = true.obs;
  List<ProductElement>? productElemnt;
  int total = 0;
  int? cartCount = 0;
  //>>>>>>>>>>>>>get item<<<<<<<<<<<<<<<//
  getCartItems() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final userId = sharedPref.get(loggedKey);
      final response = await CartServiceEndPoint().getCartItems(userId);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        print("work aayi");
        final datas = getCartItemsModelFromJson(response.data);
        print("work aayo");
        // log("-----${datas.products[0].id}");
        productElemnt = datas.products!.obs;
        log(datas.total.toString());
        total = datas.total!;
        cartCount = datas.cartCount;
        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>.$e<<<<<<<<<<<<<<<<<<');
    }
  }

  //>>>>>>>>>>>>>add item<<<<<<<<<<<<<<<//
  addCartItems(String productId) async {
    try {
      final response = await CartServiceEndPoint().addCartItems(productId);
log(response!.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final datas = addCartModelFromJson(response.data);
        if (datas.status) {
          Get.snackbar('Added succesfully', 'Product has been added to cart',
              colorText: kGreenColor, snackPosition: SnackPosition.TOP);
          getCartItems();
          isAdd.value = false;
          update();
        }
      }
    } catch (e) {
      log('add controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  //>>>>>>>>>>>>>remove item<<<<<<<<<<<<<<<//
  removeCartItems(String productId, String cartId) async {
    Map<String, dynamic> removeData = {
      "cart": cartId,
      "product": productId,
    };
    try {
      final respose = await CartServiceEndPoint().removeCartItems(removeData);
      log(respose.toString());
      if (respose!.statusCode == 200 || respose.statusCode == 201) {
        final datas = removeCartModelFromJson(respose.data);
        log(datas.toString());
        if (datas.removeProduct) {
          getCartItems();
          update();
          Get.snackbar(
              'removed succesfully', 'Product has been removed to cart',
              colorText: kredColor, snackPosition: SnackPosition.BOTTOM);

          // Get.offAll(const ScreenCart());
        }
      }
    } catch (e) {
      log('remove controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }
}

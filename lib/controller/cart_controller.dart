import 'dart:developer';

import 'package:gadgetque/model/cart/add_to_cart.dart';
import 'package:gadgetque/model/cart/get_cart_items.dart';
import 'package:gadgetque/model/cart/increment_cart_item_model.dart';
import 'package:gadgetque/model/cart/remove_cart.dart';
import 'package:gadgetque/services/cart_services.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool? isAdd;

  List<ProductElement>? productElemnt;
  int total = 0;
  Rx<int?>? cartCount;

  //>>>>>>>>>>>>>get item<<<<<<<<<<<<<<<//
  getCartItems() async {
    try {
      final response = await CartServiceEndPoint().getCartItems(userId);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = getCartItemsModelFromJson(response.data);

        productElemnt = datas.products!.obs;

        total = datas.total!;
        cartCount = datas.cartCount.obs;
        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>.$e<<<<<<<<<<<<<<<<<<');
    }
  }

  checkCartItem() {
    log("villichu");
    if (productElemnt != null) {
      for (int i = 0; i < productElemnt!.length; i++) {
        if (productElemnt![i].product.id == productId) {
          isAdd = true;
          update();
        }
      }
    } else {
      isAdd = false;
      update();
    }
  }

  //>>>>>>>>>>>>>add item<<<<<<<<<<<<<<<//
  addCartItems(String productId) async {
    try {
      final response = await CartServiceEndPoint().addCartItems(productId);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = addCartModelFromJson(response.data);
        if (datas.status) {
          Get.snackbar('Added succesfully', 'Product has been added to cart',
              colorText: kGreenColor, snackPosition: SnackPosition.TOP);

          getCartItems();

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
      final response = await CartServiceEndPoint().removeCartItems(removeData);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = removeCartModelFromJson(response.data);
        if (datas.removeProduct) {
          getCartItems();
          update();
          Get.snackbar(
              'removed succesfully', 'Product has been removed to cart',
              colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('remove controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  quantityCartItem(String? prodId, String cartId, int count) async {
    final cartDetails = {
      'user': userId,
      'cart': cartId,
      'product': prodId,
      'count': count,
    };
    try {
      final response =
          await CartServiceEndPoint().quantityCartItem(cartDetails);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = quantityCartItemModelFromJson(response.data);
        if (datas.status) {
          getCartItems();
          update();
        }
      }
    } catch (e) {
      log('increment controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  void functionCall() {
    log("function villichu");
    getCartItems();
    checkCartItem();
  }

@override
  void onInit() {
    // TODO: implement onInit
    functionCall();
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    functionCall();
    super.onReady();
  }
}

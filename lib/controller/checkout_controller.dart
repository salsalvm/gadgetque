import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/model/cod_model.dart';
import 'package:gadgetque/model/placeorder/apply_coupon.dart';
import 'package:gadgetque/model/placeorder/checkout_model.dart';
import 'package:gadgetque/services/checkout_services.dart';
import 'package:gadgetque/view/constant/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/coupon_apply.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckoutController extends GetxController {
  List<CheckoutDetailsModelAddress>? address;
  List<ProductElement>? products;
  int total = 0;
  int? colorChange;
  String? selectMethod;
  String? addressId;
  int offer = 0;

  //------------------get-------------------//
  getcheckoutDatas() async {
    try {
      final response = await CheckoutServiceEndPoint().getcheckoutDatas();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = checkoutDetailsModelFromJson(response.data);

        address = datas.addresses.obs;
        products = datas.products.obs;
        total = datas.total;

        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>$e<<<<<<<<<<<');
    }
  }

  //------------------select address-------------------//
  selectedColorChange(int index, String addressId) {
    colorChange = index;
    this.addressId = addressId;
    update();
  }

  //------------------apply coupon-------------------//
  appyCoupon(String code) async {
    try {
      final response = await CheckoutServiceEndPoint().applyCoupon(code);
      log(response.toString());
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = applyCouponModelFromJson(response.data);

        if (datas.coupon == code) {
          offer = datas.offer!;
          update();
          Get.snackbar('succesfully', 'coupon applyed successfully',
              colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar(
              'coupon applyed', 'coupon code is not valid please check',
              colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      Get.snackbar('coupon already applyed', 'coupon code is already applayed',
          colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
      log('apply controller>>>>>>>>$e<<<<<<<<<<');
    }
  }
  //------------------paymnet radio-------------------//

  selectRadioButton(String value) {
    selectMethod = value.toString();

    update();
  }

  //------------------cod-------------------//
  placeOrder() async {
    double discound = offer * total / 100;

    String disc = discound.toString();
    try {
      final response = await CheckoutServiceEndPoint()
          .placeOrder(selectMethod, addressId, disc, coupons);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = codModelFromJson(response.data);
        if (datas.codSuccess == true) {
          showGeneralDialog(
            context: Get.context!,
            barrierLabel: "Barrier",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 1500),
            pageBuilder: (_, __, ___) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    cartController.getCartItems();
                    update();
                    indexChanger.value = 0;
                    Get.offAll(
                      BottomNavigator(),
                    );
                  },
                  child: Container(
                    height: 240,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: SizedBox.expand(
                        child:
                            Lottie.asset('asset/69013-successful-check.json')),
                  ),
                ),
              );
            },
            transitionBuilder: (_, anim, __, child) {
              Tween<Offset> tween;
              if (anim.status == AnimationStatus.reverse) {
                tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
              } else {
                tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              }

              return SlideTransition(
                position: tween.animate(anim),
                child: FadeTransition(
                  opacity: anim,
                  child: child,
                ),
              );
            },
          );
        }
      }
    } catch (e) {
      log('placeOrder controller>>>>>>>>$e<<<<<<<<<<');
    }
  }
  //------------------razor pay-------------------//

  @override
  void onInit() {
    getcheckoutDatas();

    super.onInit();
  }

  final cartController = Get.put(CartController());
}

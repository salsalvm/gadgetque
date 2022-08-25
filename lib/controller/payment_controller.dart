import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/model/razorpay_model.dart';
import 'package:gadgetque/services/checkout_services.dart';
import 'package:gadgetque/view/constant/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/screens/checkout_page/widget/coupon_apply.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay razorpay;
  final controller = Get.put(CheckoutController());
  final cartController = Get.put(CartController());
  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    super.onInit();
  }

  //------------------razor pay-------------------//
  void razorPay() async {
    var options = {
      //'rzp_test_fD35e9IGT4idn9' 'rzp_test_SaEo53N8HkIN5i' //
      'key': 'rzp_test_fD35e9IGT4idn9',
      'amount': int.parse(controller.total.toString()),
      'name': 'GadgetsQue.',
      'description': 'Products',
      'timeout': 60,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse responses) async {
    controller.placeOrder();
    // double discound = controller.offer * controller.total / 100;

    // String disc = discound.toString();
    // try {
    //   final response = await CheckoutServiceEndPoint().placeOrder(
    //       controller.selectMethod, controller.addressId, disc, coupons);

    //   if (response!.statusCode == 200 || response.statusCode == 201) {
    //     final datas = razorpayModelFromJson(response.data);
        
    //     if (datas.codSuccess==true) {
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
        // }
    //   }
    // } catch (e) {
    //   log('payment controller>>>>>>>>$e<<<<<<<<<<');
    // }
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}

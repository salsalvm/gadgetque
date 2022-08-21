import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/bottom_navigator/bottom_navigation.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay razorpay;
  final controller = Get.put(CheckoutController());
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
      'key': 'rzp_test_fD35e9IGT4idn9',
      'amount': int.parse(controller.total.toString()) * 100,
      'name': 'GadgetsQue.',
      'description': 'Products',
      'timeout': 60,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    controller.placeOrder();
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
              indexChanger.value = 0;
              Get.offAll(BottomNavigator());
            },
            child: Container(
              height: 240,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: SizedBox.expand(
                  child: Lottie.asset('asset/69013-successful-check.json')),
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

  void _handlePaymentError(PaymentFailureResponse response) {
   
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}

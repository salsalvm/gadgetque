import 'dart:developer';

import 'package:gadgetque/model/apply_coupon.dart';
import 'package:gadgetque/model/checkout_model.dart';
import 'package:gadgetque/services/checkout_services.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List<CheckoutDetailsModelAddress>? address;
  List<ProductElement>? products;
  Rx<int?>? total;
  int? colorChange;
  String? select;
  // get checkout datas //
  getcheckoutDatas() async {
    try {
      final response = await CheckoutServiceEndPoint().getcheckoutDatas();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = checkoutDetailsModelFromJson(response.data);

        address = datas.addresses.obs;
        products = datas.products.obs;
        total = datas.total.obs;
        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  selectedColorChange(index, addressId) {
    log('message');
    colorChange = index;
    update();
  }

// apply coupon //
  appyCoupon(String code) async {
    Map<String, dynamic> couponCode = {"Coupon": code};
    try {
      final response = await CheckoutServiceEndPoint().applyCoupon(couponCode);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = applyCouponModelFromJson(response.data);
        if (datas.status == false) {
          Get.snackbar('succesfully', 'coupon applyed successfully',
              colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar(
              'coupon applyed', 'coupon code is not valid please check',
              colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('apply controller>>>>>>>>$e<<<<<<<<<<');
    }
  }
// payment select  //

  selectRadioButton(String value) {
    select = value.toString();
    log('>><<>><<$select');
    update();
  }

  @override
  void onInit() {
    getcheckoutDatas();
    super.onInit();
  }
}

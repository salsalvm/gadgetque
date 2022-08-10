import 'dart:developer';

import 'package:gadgetque/model/placeorder/cancel_order_model.dart';
import 'package:gadgetque/model/placeorder/order_mode.dart';
import 'package:gadgetque/model/placeorder/ordered_product_model.dart';
import 'package:gadgetque/services/order_service.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/screens/my_order_page/screen_view_product.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Order>? orderList;
  List<ProductElement>? products;

  getOrderDetails() async {
    try {
      final response = await OrderServicesEndPoint().getOrderDetails();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = myOrderModelFromJson(response.data);
        if (datas.orders != null) {
          orderList = datas.orders!.obs;
          update();
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>$e<<<<<<<<');
    }
  }

  getOrderProduct(String orderId) async {
    try {
      final response = await OrderServicesEndPoint().getOrderProduct(orderId);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = orderedProductModelFromJson(response.data);
        if (datas.products != null) {
          products = datas.products!.obs;
          Get.to(const ScreenViewOrder());
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>$e<<<<<<<<<<');
    }
  }

  cancelOrder(String orderId) async {
    try {
      final response = await OrderServicesEndPoint().canceOrder(orderId);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = cancelOrderModelFromJson(response.data);
        if (datas.acknowledged) {
          getOrderDetails();
          update();
          Get.back();
          Get.snackbar('cancell order', 'successfully cancelled order',
              colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>$e<<<<<<<<<<');
    }
  }

  @override
  void onInit() {
    getOrderDetails();

    super.onInit();
  }
}

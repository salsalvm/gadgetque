import 'dart:developer';
import 'dart:io';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/services/home_services.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product>? products;
  List<Category>? categories;

  List<AllCoupon>? coupon;

  //------------------get home-------------------//
  Future<List<HomeDatasModel>?> homeDatas() async {
    try {
      final response = await HomeServices().getHomeDatas();
      
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = homeDatasModelFromJson(response.data);

        products = datas.products!.obs;
        categories = datas.category.obs;
        coupon = datas.allCoupons.obs;

        update();
      }
    } on SocketException catch (_) {
      Get.snackbar(
        'No Internet',
        'please connect a valid WIFI',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    } catch (e) {
      log('get home controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return [];
  }

  @override
  void onInit() {
    homeDatas();
    super.onInit();
  }
}

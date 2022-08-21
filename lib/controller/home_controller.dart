import 'dart:developer';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/services/home_services.dart';
import 'package:gadgetque/view/screens/home/screen_category.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product>? products;
  List<Category>? categories;
  List<Prodatum>? categoryItems;
  List<AllCoupon>? coupon;
   //------------------get home-------------------//
  Future<List<HomeDatasModel>?> homeDatas() async {
    try {
      final response = await HomeServices().getHomeDatas();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = homeDatasModelFromJson(response.data);

        products = datas.products.obs;
        categories = datas.category.obs;
        coupon = datas.allCoupons.obs;
        update();
      }
    } catch (e) {
      log('get home controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return [];
  }
 //------------------get category-------------------//
  getCategoryDatas(String category) async {
    try {
      final response = await HomeServices().getCatogoriesDatas(category);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = categoryDatasModelFromJson(response.data);
        categoryItems = datas.prodata.obs;
      }

      Get.to(
        ScreenCategory(category: category),
      );
    } catch (e) {
      log('get category controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  @override
  void onInit() {
    homeDatas();

    super.onInit();
  }
}

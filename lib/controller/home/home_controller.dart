import 'dart:developer';
import 'package:gadgetque/model/home/category_datas_model.dart';
import 'package:gadgetque/model/home/home_datas_model.dart';
import 'package:gadgetque/model/services/home_services.dart';
import 'package:gadgetque/view/screens/home/category/screen_category.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product>? products;
  List<Category>? categories;
  List<Prodatum>? categoryItems;
  Future<List<HomeDatasModel>?> homeDatas() async {
    try {
      final response = await HomeServices().getHomeDatas();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = homeDatasModelFromJson(response.data);

        products = datas.products.obs;
        categories = datas.category.obs;
        update();
      }
      // else {
      //   ItemText(
      //       name: 'No datas available',
      //       weight: FontWeight.w400,
      //       fontSize: 16,
      //       color: kGreenColor);
      // }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

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
      log(e.toString());
    }
  }

  @override
  void onInit() {
    homeDatas();

    super.onInit();
  }
}

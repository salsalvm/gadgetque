import 'dart:developer';

import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/services/home_services.dart';
import 'package:gadgetque/view/screens/home/screen_category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  String? cat;
  List<Prodatum>? categoryItems;
  //------------------get category-------------------//
  getCategoryDatas(String? category) async {
    cat = category!;
    try {
      final response = await HomeServices().getCatogoriesDatas(category);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = categoryDatasModelFromJson(response.data);

        categoryItems = datas.prodata!.obs;
      }
      Get.to(
        ScreenCategory(category: category),
      );
    } catch (e) {
      log('get category controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
  }

  @override
  void onready() {
    getCategoryDatas(cat);
    // TODO: implement onInit
    super.onInit();
  }
}

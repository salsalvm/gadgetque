import 'dart:developer';

import 'package:gadgetque/model/profile/get_profile_model.dart';
import 'package:gadgetque/model/profile/update_profile_model.dart';
import 'package:gadgetque/services/profile_services.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  String? userName;
  String? mail;
  //------------------get-------------------//
  getProfile() async {
    try {
      final response = await ProfileServicesEndPoint().getProfile();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = getProfileModelFromJson(response.data);
        userName = datas.user.name;
        mail = datas.user.emailaddress;
        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<this');
    }
  }

  //------------------update-------------------//
  updateProfile(String name, String mail) async {
    Map<String, dynamic> updatedDetails = {
      "Name": name,
      "Emailaddress": mail,
    };
    final response =
        await ProfileServicesEndPoint().updateProfile(updatedDetails);
    log(response.toString());
    if (response!.statusCode == 200 || response.statusCode == 201) {
      final datas = updateProfileModelFromJson(response.data);
      if (datas.acknowledged) {
        getProfile();
        update();
        Get.snackbar('updatted succesfully', 'profile has been updatted',
            colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}

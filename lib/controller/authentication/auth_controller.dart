import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gadgetque/controller/authentication/auth_service.dart';
import 'package:gadgetque/model/authentication/login_model.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //<<<<<<<<<<<<<<<<user signin status>>>>>>>>>>>>>>>>>>>//
  signinUser(String mail, String password) async {
    Map<String, dynamic> signinData = {
      "Email": mail,
      "Password": password,
    };

    try {
      final response = await ApiServices().checkLogin(signinData);

      if (response!.data == null) {
        log('<<<<<<<<${response.data}>>>>>>>');
        Get.snackbar(
          'Login Error',
          'entered null response',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
      } else {
        final data = loginModelFromJson(
          response.data,
        );
        Get.snackbar(
          'hey, ${data.response.user.name}',
          'discover your unique style',
          colorText: kGreenColor,
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
        );
        Get.to(
          BottomNavigator(),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Error',
        'entered mail or password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    }
  }

  signupUser() {}
  signoutUser() {}
}

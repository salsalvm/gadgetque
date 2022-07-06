import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gadgetque/controller/authentication/auth_service.dart';
import 'package:gadgetque/model/authentication/signin_model.dart';
import 'package:gadgetque/model/authentication/signup_model.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/authentication/screen_signin/screen_signin.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Get.snackbar(
          'Login Error',
          'entered null response',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
      } else {
        final data = signinModelFromJson(
          response.data,
        );
        Get.offAll(
          BottomNavigator(),
        );
        Get.snackbar(
          'hey, ${data.response.user.name}',
          'discover your unique style',
          colorText: kGreenColor,
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
        );
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(loggedKey, true);
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

//<<<<<<<<<<<<<<<<user signup status>>>>>>>>>>>>>>>>>>>//
  signupUser(String name, String mobile, String mail, String password,
      String confirmPassword) async {
    Map<String, dynamic> signupData = {
      "Name": name,
      "Mobile": mobile,
      "Emailaddress": mail,
      "Password": password,
      "confirmPass": confirmPassword,
    };
    try {
      final response = await ApiServices().checkSignin(signupData);
      if (response == true) {
        Get.snackbar(
          'Signup Error',
          'entered mail or mobile is already there',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
      } else {
        final data = signupModelFromJson(
          response!.data,
        );
        Get.snackbar(
          'successfully creatted',
          'discover your own style',
          colorText: kGreenColor,
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
        );
        Get.to(ScreenSignin());
      }
    } catch (e) {
      Get.snackbar(
        'Signup Error',
        'entered mail or mobile is already there',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    }
  }

  //<<<<<<<<<<<<<<<<user signout status>>>>>>>>>>>>>>>>>>>//
  signoutUser() async {
    try {
      final response = await ApiServices().checkSignout();
      if (response != null) {
        Get.snackbar(
          'signout successful',
          'please visit once again',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.clear();
        Get.offAll(ScreenSignin());
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/no_internet.dart';
import 'package:gadgetque/view/screens/authentication/screen_signin.dart';
import 'package:gadgetque/view/screens/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/screens/authentication/widget/background_image.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Size size;
const loggedKey = 'login successful';
Object? userId;

class ScreenEntry extends StatefulWidget {
  const ScreenEntry({Key? key}) : super(key: key);

  @override
  State<ScreenEntry> createState() => _ScreenEntryState();
}

class _ScreenEntryState extends State<ScreenEntry> {
  @override
  void initState() {
    checkUserLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    checkUserLogin();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/login_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const EntryAppbar(
                      iconColor: kGreyColor, textColor: kWhiteColor),
                  const SizedBox(
                    width: 300,
                  ),
                  const Text(
                    'Discover  Your \n  Unique Style',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor),
                  ),
                  kHeigt100,
                  const Text(
                    'Explore all the Exiting stuffs...               \nBased on your style.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  kHeigt50,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkUserLogin() async {
    bool conection = await InternetConnectionChecker().hasConnection;
    if (conection == true) {
      final sharedPref = await SharedPreferences.getInstance();
      userId = sharedPref.get(loggedKey);
      try {
        if (userId == null || userId == false) {
          await Future.delayed(const Duration(seconds: 1));
          Get.offAll(ScreenSignin());
        } else {
          await Future.delayed(const Duration(seconds: 1));
          Get.offAll(BottomNavigator());
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      Get.snackbar(
        'No Internet',
        'please connect a valid WIFI',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
      Get.to(const NoInternet());
    }
  }
}

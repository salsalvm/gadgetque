import 'package:flutter/material.dart';
import 'package:gadgetque/view/authentication/screen_signin/screen_signin.dart';
import 'package:gadgetque/view/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/authentication/widget/background_image.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Size size;
final loggedKey = 'login successful';

class ScreenEntry extends StatelessWidget {
  const ScreenEntry({Key? key}) : super(key: key);

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
                children: const [
                  EntryAppbar(iconColor: kGreyColor, textColor: kWhiteColor),
                  kHeigt300,
                  Text(
                    'Discover  Your \n  Unique Style',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor),
                  ),
                  kHeigt100,
                  Text(
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
  
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.get(loggedKey);
    if (loggedKey == null || loggedKey == false) {
       await Future.delayed(const Duration(seconds: 2));
      Get.offAll(ScreenSignin());
    } else { await Future.delayed(const Duration(seconds: 2));
      Get.offAll(BottomNavigator());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_login/screen_login.dart';
import 'package:gadgetque/view/entry_pages/screen_signup/screen_signup.dart';
import 'package:gadgetque/view/entry_pages/widget/action_button.dart';
import 'package:gadgetque/view/entry_pages/widget/app_bar.dart';
import 'package:gadgetque/view/entry_pages/widget/background_image.dart';
import 'package:get/get.dart';
late Size size ;
class ScreenEntry extends StatelessWidget {
  const ScreenEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold( resizeToAvoidBottomInset: false,
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
                  kHeigt300,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      EntryButton(
                          height: size.width * 0.15,
                          width: size.width * 0.4,
                          color: Colors.grey.withOpacity(0.5),
                          // size: size,
                          buttonName: 'Login',
                          onTap: () {
                            Get.to(ScreenLogin());
                          }),
                      EntryButton(
                          height: size.width * 0.15,
                          width: size.width * 0.4,
                          color: Colors.grey.withOpacity(0.5),
                          // size: size,
                          buttonName: 'Register',
                          onTap: () {
                            Get.to(ScreenSignup());
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

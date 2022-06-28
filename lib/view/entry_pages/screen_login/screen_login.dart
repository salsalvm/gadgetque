import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_login/widget/login_button.dart';
import 'package:gadgetque/view/entry_pages/screen_signup/screen_signup.dart';
import 'package:gadgetque/view/entry_pages/widget/app_bar.dart';
import 'package:gadgetque/view/entry_pages/widget/background_image.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/entry_pages/widget/switch_bottom_textbutton.dart';
import 'package:get/get.dart';
class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EntryAppbar(
                    iconColor: kGreyColor,
                    textColor: kWhiteColor,
                  ),
                  kHeigt100,
                  const Text(
                    'Hey ,\nLogin Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt150,
                  FormFields(name: 'Email', color: kFormColor,inputTextColor: kWhiteColor),
                  FormFields(name: 'Password', color: kFormColor,inputTextColor: kWhiteColor),
                  LoginButton(),
                  kHeigt150,
                  SwitchBottomTextButton(onTap: () {
                   Get.to(ScreenSignup());
                  }, text: 'Register Now')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

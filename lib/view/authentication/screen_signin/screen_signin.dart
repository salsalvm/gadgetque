import 'package:flutter/material.dart';
import 'package:gadgetque/controller/authentication/auth_controller.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/authentication/screen_signup/screen_signup.dart';
import 'package:gadgetque/view/authentication/widget/action_button.dart';
import 'package:gadgetque/view/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/authentication/widget/background_image.dart';
import 'package:gadgetque/view/authentication/widget/switch_bottom_textbutton.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:get/get.dart';

class ScreenSignin extends StatelessWidget {
  ScreenSignin({Key? key}) : super(key: key);
  final authController = Get.put(AuthenticationController());
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                  FormFields(
                    controller: _mailController,
                    fontSize: 20,
                    name: 'Mail',
                    color: kFormColor,
                    inputTextColor: kWhiteColor,
                  ),
                  FormFields(
                      controller: _passwordController,
                      fontSize: 20,
                      name: 'Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: EntryButton(
                        color: kFormColor,
                        height: size.width * 0.1,
                        onTap: () {
                          authController.signinUser(
                              _mailController.text.trim(),
                              _passwordController.text.trim());
                        },
                        buttonName: 'Sign in',
                        width: size.width * 0.83),
                  ),
                  kHeigt150,
                  SwitchBottomTextButton(
                      onTap: () {
                        Get.offAll(ScreenSignup());
                      },
                      text: 'Register Now'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

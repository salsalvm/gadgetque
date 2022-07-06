import 'package:flutter/material.dart';
import 'package:gadgetque/controller/authentication/auth_controller.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/authentication/screen_signin/screen_signin.dart';
import 'package:gadgetque/view/authentication/widget/action_button.dart';
import 'package:gadgetque/view/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/authentication/widget/background_image.dart';
import 'package:gadgetque/view/authentication/widget/switch_bottom_textbutton.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';

import 'package:get/get.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({Key? key}) : super(key: key);
  final authControll = Get.put(AuthenticationController());
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
                      iconColor: kGreyColor, textColor: kWhiteColor),
                  kHeigt80,
                  const Text(
                    'Hey ,\nSign Up Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt100,
                  FormFields(
                      controller: _nameController,
                      name: 'Name',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      controller: _mobileController,
                      name: 'Mobile',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      controller: _mailController,
                      name: 'Mail',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      controller: _passwordController,
                      name: 'Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      controller: _confirmPasswordController,
                      name: 'Confirm Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  kHeigt5,
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: EntryButton(
                        color: kFormColor,
                        height: size.width * 0.12,
                        // size: size,
                        onTap: () {
                          authControll.signupUser(
                            _nameController.text.trim(),
                            _mobileController.text.trim(),
                            _mailController.text.trim(),
                            _passwordController.text.trim(),
                            _confirmPasswordController.text.trim(),
                          );
                        },
                        buttonName: 'Submit',
                        width: size.width * 0.836),
                  ),
                  kHeigt80,
                  SwitchBottomTextButton(
                      onTap: () {
                        Get.offAll(ScreenSignin());
                      },
                      text: 'Signin')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

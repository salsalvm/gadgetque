import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/controller/validationController.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/screen_signup.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/authentication/widget/action_button.dart';
import 'package:gadgetque/view/screens/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/screens/authentication/widget/background_image.dart';
import 'package:gadgetque/view/screens/authentication/widget/error_text.dart';
import 'package:gadgetque/view/screens/authentication/widget/switch_bottom_textbutton.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:get/get.dart';

class ScreenSignin extends StatelessWidget {
  ScreenSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    kHeigt100,
                    Column(
                      children: [
                        CustomFormfield(
                          validator: (mail) {
                            validController.mailValidation(mail);
                          },
                          icon: Icons.mail,
                          controller: _mailController,
                          fontSize: 20,
                          name: 'Mail',
                          color: kFormColor,
                          inputTextColor: kWhiteColor,
                        ),
                        Obx(
                          () => ErrorText(
                              errorText: 'enter valid mail',
                              isVisible: validController.email.value),
                        ),
                        CustomFormfield(
                            validator: (password) {
                              validController.passwordValidation(password);
                            },
                            icon: Icons.lock,
                            controller: _passwordController,
                            fontSize: 20,
                            obscureText: true,
                            name: 'Password',
                            color: kFormColor,
                            inputTextColor: kWhiteColor),
                        Obx(
                          () => ErrorText(
                              errorText: 'please enter 6 digits valid password',
                              isVisible: validController.pass.value),
                        ),
                        kHeigt10,
                        EntryButton(
                            color: kFormColor,
                            height: size.width * 0.12,
                            onTap: signinButtonPressed,
                            buttonName: 'Sign in',
                            width: size.width * 0.823),
                        kHeigt20,
                        Obx(
                          () => Visibility(
                              visible: authController.isLoading.value,
                              child: const Center(
                                  child: CupertinoActivityIndicator(
                                color: Colors.green,
                              ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .2,
                    ),
                    SwitchBottomTextButton(
                        onTap: () {
                          Get.offAll(ScreenSignup());
                        },
                        text: 'Register Now'),
                    kHeigt20
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signinButtonPressed() {
    final mail = _mailController.text.trim();
    final password = _passwordController.text.trim();
    if (mail.isEmpty || password.isEmpty) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'fill the field',
          'Every Fields Are Required',
          colorText: kredColor);
      return;
    } else {
      authController.signinUser(mail, password);
    }
  }

  final validController = Get.put(ValidationController());
  final authController = Get.put(AuthenticationController());
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
}

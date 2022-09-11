import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/controller/validationController.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/screen_signin.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/authentication/widget/action_button.dart';
import 'package:gadgetque/view/screens/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/screens/authentication/widget/background_image.dart';
import 'package:gadgetque/view/screens/authentication/widget/error_text.dart';
import 'package:gadgetque/view/screens/authentication/widget/switch_bottom_textbutton.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:get/get.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EntryAppbar(
                        iconColor: kGreyColor, textColor: kWhiteColor),
                    kHeigt50,
                    const Text(
                      'Hey ,\nSign Up Now.',
                      style: TextStyle(color: kWhiteColor, fontSize: 28),
                    ),
                    kHeigt50,
                    CustomFormfield(
                        validator: (name) {
                          validController.nameValidation(name);
                        },
                        icon: Icons.person,
                        controller: _nameController,
                        name: 'Name',
                        color: kFormColor,
                        inputTextColor: kWhiteColor),
                    Obx(
                      () => ErrorText(
                          errorText: 'minimum 3 character required',
                          isVisible: validController.names.value),
                    ),
                    CustomFormfield(
                        validator: (mobile) {
                          validController.mobileValidation(mobile);
                        },
                        icon: Icons.phone,
                        controller: _mobileController,
                        name: 'Mobile',
                        keyboardType: TextInputType.number,
                        color: kFormColor,
                        inputTextColor: kWhiteColor),
                    Obx(
                      () => ErrorText(
                          errorText: 'enter 10 digits',
                          isVisible: validController.phone.value),
                    ),
                    CustomFormfield(
                        validator: (mail) {
                          validController.mailValidation(mail);
                        },
                        icon: Icons.mail,
                        controller: _mailController,
                        name: 'Mail',
                        color: kFormColor,
                        inputTextColor: kWhiteColor),
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
                        obscureText: true,
                        controller: _passwordController,
                        name: 'Password',
                        color: kFormColor,
                        inputTextColor: kWhiteColor),
                    Obx(
                      () => ErrorText(
                          errorText: 'enter minimum 6 digits',
                          isVisible: validController.pass.value),
                    ),
                    CustomFormfield(
                        validator: (password) {
                          validController.passwordValidation(password);
                        },
                        icon: Icons.lock,
                        obscureText: true,
                        controller: _confirmPasswordController,
                        name: 'Confirm Password',
                        color: kFormColor,
                        inputTextColor: kWhiteColor),
                    Obx(
                      () => ErrorText(
                          errorText: 'enter minimum 6 digits',
                          isVisible: validController.pass.value),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, top: 10),
                      child: EntryButton(
                          color: kFormColor,
                          height: size.width * 0.115,
                          onTap: signupButtonPressed,
                          buttonName: 'Submit',
                          width: size.width * 0.825),
                    ),
                    Obx(() => Visibility(
                        visible: authController.isLoading.value,
                        child:
                            const Center(child: CupertinoActivityIndicator()))),
                    kHeigt50,
                    SwitchBottomTextButton(
                        onTap: () {
                          Get.offAll(ScreenSignin());
                        },
                        text: 'Signin')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signupButtonPressed() {
    if (_nameController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty ||
        _mailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _mobileController.text.trim().isEmpty) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'fill the field',
          'Every Fields Are Required',
          colorText: kredColor);
      return;
    } else {
      authController.signupUser(
        _nameController.text.trim(),
        _mobileController.text.trim(),
        _mailController.text.trim(),
        _passwordController.text.trim(),
        _confirmPasswordController.text.trim(),
      );
    }
  }

  final authController = Get.put(AuthenticationController());
  final validController = Get.put(ValidationController());
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
}

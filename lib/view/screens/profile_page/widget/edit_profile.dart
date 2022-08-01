import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/profile_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String mail;
  EditProfile({
    Key? key,
    required this.name,
    required this.mail,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    nameController.text = widget.name;
    mailController.text = widget.mail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFields(
                  validator: (value) {},
                  fontSize: 20,
                  controller: nameController,
                  icon: Icons.person,
                  name: 'name',
                  color: kFormColor,
                  textColor: kBlack54Color),
              FormFields(
                  controller: mailController,
                  validator: (value) {},
                  icon: Icons.mail,
                  name: 'mail',
                  color: kFormColor,
                  textColor: kBlack54Color),
              kHeigt10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(
                        buttonWidth: size.width * .35,
                        fontSize: 18,
                        buttonHeight: size.width * .115,
                        text: 'Cancel',
                        buttonColor: Colors.white.withOpacity(.2),
                        fontColor: kWhiteColor,
                        onTap: () {
                          Get.back();
                        }),
                    ActionButton(
                        buttonWidth: size.width * .35,
                        buttonHeight: size.width * .115,
                        fontColor: kWhiteColor,
                        fontSize: 18,
                        text: 'Update',
                        buttonColor: Colors.white.withOpacity(.2),
                        onTap: () {
                          final name = nameController.text.trim();
                          final mail = mailController.text.trim();
                          if (name.isEmpty || mail.isEmpty) {
                            Get.snackbar(
                                snackPosition: SnackPosition.BOTTOM,
                                'fill the field',
                                'Every Fields Are Required',
                                colorText: kredColor);
                            return;
                          } else {
                            profileController.updateProfile(name, mail);
                            Get.back();
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final nameController = TextEditingController();

  final mailController = TextEditingController();

  final profileController = Get.put(ProfileController());
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.56,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: kRAdius10,
        color: kBoxColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextElementsInRow(
                onTap: () {
                  // Get.to(const UpdateProfile());
                  Get.dialog(BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormFields(fontSize: 20,
                      name: 'Salsal',
                      color: kGreyColor,
                      textColor: kBlackColor),
                  FormFields(
                      name: 'salsal123@gmail.com',
                      color: kGreyColor,
                      textColor: kBlackColor),
                  FormFields(
                      name: '+91 7558959094',
                      color: kGreyColor,
                      textColor: kBlackColor),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      kWidth5,
                      ActionButton(
                          buttonWidth: size.width * .35,
                          fontSize: 20,
                          buttonHeight: 40,
                          text: 'CANCEL',
                          buttonColor: kButtonColor,
                          fontColor: kWhiteColor,
                          onTap: () {}),
                      ActionButton(
                          buttonWidth: size.width * .35,
                          buttonHeight: 40,
                          fontColor: kWhiteColor,
                          fontSize: 20,
                          text: 'UPDATE',
                          buttonColor: kButtonColor,
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),);
                },
                paddding: 5,
                firstText: 'Profile',
                secondText: 'Edit',
                wieght: FontWeight.bold,
                fontSize: 20,
                fontColor: kBlackColor),
            const DivLine(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: kGreenColor,
                  radius: 45,
                  child: const Text('no image'),
                ),
              ),
            ),
            kHeigt5,
            const TextElementsInRow(
                firstText: 'NAME   :',
                secondText: "SALSAL VM",
                wieght: FontWeight.w600,
                fontSize: 20,
                fontColor: kBlackColor),
            kHeigt10,
            const TextElementsInRow(
                firstText: 'Mail      :',
                secondText: "abc@gmail.com",
                wieght: FontWeight.w600,
                fontSize: 18,
                fontColor: kBlack54Color)
          ],
        ),
      ),
    );
  }
}

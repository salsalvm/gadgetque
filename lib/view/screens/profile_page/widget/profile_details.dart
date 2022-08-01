import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/profile_page/widget/change_password.dart';
import 'package:gadgetque/view/screens/profile_page/widget/edit_profile.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.688,
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
                  Get.dialog(
                  const  EditProfile()
                  );
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
                firstText: 'Mail         :',
                secondText: "abc@gmail.com",
                wieght: FontWeight.w600,
                fontSize: 18,
                fontColor: kBlack54Color),
            kHeigt5,
            ActionButton(
                buttonColor: Colors.white.withOpacity(0.1),
                fontSize: 18,
                buttonWidth: size.width,
                buttonHeight: 38,
                text: 'Change Password',
                onTap: () {
                  Get.dialog(const ChangePassword());
                })
          ],
        ),
      ),
    );
  }


}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/profile_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
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
      height: size.height * 0.34,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: kRAdius10,
        color: kBoxColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) => controller.userName == null
              ? const Center(child: CupertinoActivityIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextElementsInRow(
                        onTap: () {
                          Get.dialog(EditProfile(
                            name: controller.userName!,
                            mail: controller.mail!,
                          ));
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
                          backgroundImage:
                              const AssetImage('asset/noimage.jpeg'),
                          backgroundColor: kGreenColor,
                          radius: 45,
                        ),
                      ),
                    ),
                    kHeigt5,
                    TextElementsInRow(
                        firstText: 'NAME    :',
                        secondText:
                            controller.userName ?? 'No Name'.toUpperCase(),
                        wieght: FontWeight.w600,
                        fontSize: 20,
                        fontColor: kBlackColor),
                    kHeigt5,
                    TextElementsInRow(
                        firstText: 'Mail         :',
                        secondText: controller.mail ?? 'mail not available',
                        wieght: FontWeight.w600,
                        fontSize: 18,
                        fontColor: kBlack54Color),
                    kHeigt5,
                    ActionButton(
                        buttonColor: Colors.white.withOpacity(0.1),
                        fontSize: 18,
                        buttonWidth: size.width,
                        buttonHeight: size.height * 0.045,
                        text: 'Change Password',
                        onTap: () {
                          Get.dialog(const ChangePassword());
                        })
                  ],
                ),
        ),
      ),
    );
  }
}

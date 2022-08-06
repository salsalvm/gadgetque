import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/services/profile_services.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/profile_page/widget/wallet_balance.dart';
import 'package:gadgetque/view/screens/profile_page/widget/profile_details.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:get/get.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);
  final authController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(70), child: AppbarMain()),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SafeArea(
                child: ListView(
              children: const [
                ProfileDetails(),
                kHeigt10,
                WalletBalance(),
                kHeigt10,
              ],
            )),
          ),
          ActionButton(
            radius: 0,
            buttonWidth: size.width,
            buttonHeight: 50,
            text: 'Sign Out',
            onTap: () {
              Get.defaultDialog(
                backgroundColor: kBoxColor,
                buttonColor: kButtonColor,
                middleText: 'Do you Want to log out',
                onConfirm: () {
                  authController.signoutUser();
                },
                title: 'Are You Sure',
                onCancel: () {},
              );
            },
          )
        ],
      ),
    );
  }
}

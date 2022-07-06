import 'package:flutter/material.dart';
import 'package:gadgetque/controller/authentication/auth_controller.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/profile/widget/change_password.dart';
import 'package:gadgetque/view/screens/profile/widget/wallet_balance.dart';
import 'package:gadgetque/view/screens/profile/widget/profile_details.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:get/get.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);
  final authController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
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
                ChangePassword(),
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
              authController.signoutUser();
            },
          )
        ],
      ),
    );
  }
}

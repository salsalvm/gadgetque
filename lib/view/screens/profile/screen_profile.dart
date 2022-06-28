import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/profile/widget/change_password.dart';
import 'package:gadgetque/view/screens/profile/widget/wallet_balance.dart';
import 'package:gadgetque/view/screens/profile/widget/profile_details.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppbarMain()),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SafeArea(
                child: ListView(
              children: [
                ProfileDetails(),
                kHeigt10,
                WalletBalance(),
                kHeigt10,
                ChangePassword(),
                kHeigt10,
              ],
            )),
          ),
          ActionButton(radius: 0,
            buttonWidth: size.width,
            buttonHeight: 50,
            text: 'Log Out',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

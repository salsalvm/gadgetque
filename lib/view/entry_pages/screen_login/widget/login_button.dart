
import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/entry_pages/widget/action_button.dart';
import 'package:get/get.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EntryButton(
              color: kFormColor,
              height: size.width * 0.1,
              // size: size,
              onTap: () {},
              buttonName: 'Otp Login?',
              width: size.width * 0.4),
          EntryButton(
              color: kFormColor,
              height: size.width * 0.1,
              // size: size,
              onTap: () {
                 Get.to(BottomNavigator());
              },
              buttonName: 'Sign Up',
              width: size.width * 0.4)
        ],
      ),
    );
  }
}

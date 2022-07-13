import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: size.width * .54,
          width: size.width,
          decoration: BoxDecoration(borderRadius: kRAdius10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const ItemText(
                //     name: 'Change Password',
                //     weight: FontWeight.bold,
                //     fontSize: 18,
                //     color: kBlackColor),
                // const DivLine(),
                kHeigt5,
                FormFields(validator: (value) {
                  
                },
                  obscureText: true,
                  icon: Icons.lock,
                  name: 'Current Password',
                  color: Colors.white.withOpacity(0.26),
                ),
                FormFields(validator: (value) {
                  
                },
                  obscureText: true,
                  icon: Icons.lock,
                  name: 'New Password',
                  color: Colors.white.withOpacity(0.26),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButton(
                          buttonWidth: size.width * .33,
                          buttonColor: Colors.white.withOpacity(0.2),
                          buttonHeight: size.width * 0.12,
                          text: 'Cancel',
                          fontSize: 16,
                          onTap: () {}),
                      ActionButton(
                          buttonWidth: size.width * .33,
                          buttonColor: Colors.white.withOpacity(0.2),
                          buttonHeight: size.width * 0.12,
                          text: 'Update',
                          fontSize: 16,
                          onTap: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

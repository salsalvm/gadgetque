import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
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

    return Container(
      height: size.width*.49,
      width: size.width,
      decoration:
          BoxDecoration(color: kBoxColor, borderRadius: kRAdius10),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemText(
                name: 'Change Password',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            const DivLine(),
            kHeigt5,
            FormFields(
              name: 'Current Password',
              color: Colors.white.withOpacity(0.26),
            ),
            FormFields(
              name: 'New Password',
              color: Colors.white.withOpacity(0.26),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kWidth5,
                ActionButton(
                    buttonColor: Colors.white.withOpacity(0.1),
                    buttonWidth: size.width * 0.37,
                    buttonHeight: size.width * 0.1,
                    text: 'Cancel',
                    fontSize: 20,
                    onTap: () {}),
                ActionButton(
                    buttonWidth: size.width * 0.37,
                    buttonColor: Colors.white.withOpacity(0.1),
                    buttonHeight: size.width * 0.1,
                    text: 'Update',
                    fontSize: 20,
                    onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

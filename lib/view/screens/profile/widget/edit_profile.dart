
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

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
              FormFields(validator: (value) {
                
              },
                  fontSize: 20,
                  icon: Icons.person,
                  name: 'Salsal',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(validator: (value) {
                
              },
                  icon: Icons.mail,
                  name: 'salsal123@gmail.com',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(validator: (value) {},
                  icon: Icons.phone,
                  name: '+91 7558959094',
                  color: kFormColor,
                  textColor: kBlackColor),
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
        buttonColor:Colors.white.withOpacity(.2),
        fontColor: kWhiteColor,
        onTap: () {}),
    ActionButton(
        buttonWidth: size.width * .35,
        buttonHeight: size.width * .115,
        fontColor: kWhiteColor,
        fontSize: 18,
        text: 'Update',
        buttonColor: Colors.white.withOpacity(.2),
        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

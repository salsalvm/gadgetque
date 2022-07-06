import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';


class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

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
                  FormFields(
                      name: 'Name',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'Building',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'Area',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'City',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'State',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'Pin', color: kFormColor, textColor: kBlack54Color),
                  FormFields(
                      name: 'Catogoy',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  FormFields(
                      name: 'Mobile',
                      color: kFormColor,
                      textColor: kBlack54Color),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      kWidth5,
                      ActionButton(
                          buttonWidth: size.width * .35,
                          fontSize: 22,
                          buttonHeight: 40,
                          text: 'CANCEL',
                          buttonColor: kFormColor,
                          fontColor: kBlackColor,
                          onTap: () {}),
                      ActionButton(
                          buttonWidth: size.width * .35,
                          buttonHeight: 40,
                          fontColor: kBlackColor,
                          fontSize: 22,
                          text: 'ADD',
                          buttonColor: kFormColor,
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

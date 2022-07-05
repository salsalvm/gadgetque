import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';

class AddEditAddress extends StatelessWidget {
  const AddEditAddress({
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
              FormFields(
                  name: 'Name',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'Building',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'Area',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'City',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'State',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'Pin',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'Catogoy',
                  color: kGreyColor,
                  textColor: kBlackColor),
              FormFields(
                  name: 'Mobile',
                  color: kGreyColor,
                  textColor: kBlackColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  kWidth5,
                  ActionButton(
                      buttonWidth: size.width * .35,
                      fontSize: 20,
                      buttonHeight: 40,
                      text: 'CANCEL',
                      buttonColor: kFormColor,
                      fontColor: kWhiteColor,
                      onTap: () {}),
                  ActionButton(
                      buttonWidth: size.width * .35,
                      buttonHeight: 40,
                      fontColor: kWhiteColor,
                      fontSize: 20,
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

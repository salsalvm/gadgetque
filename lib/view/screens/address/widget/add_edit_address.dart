import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
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
                  icon: Icons.person,
                  validator: (value) {},
                  name: 'Name',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.home,
                  validator: (value) {},
                  name: 'Building',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.school,
                  validator: (value) {},
                  name: 'Area',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.location_city,
                  validator: (value) {},
                  name: 'City',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.flag,
                  validator: (value) {},
                  name: 'State',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.pin,
                  validator: (value) {},
                  name: 'Pin',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.category,
                  validator: (value) {},
                  name: 'Catogoy',
                  color: kFormColor,
                  textColor: kBlackColor),
              FormFields(
                  icon: Icons.phone,
                  validator: (value) {},
                  name: 'Mobile',
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
                        buttonHeight: 40,
                        text: 'Cancel',
                        buttonColor: Colors.white.withOpacity(0.2),
                        fontColor: kWhiteColor,
                        onTap: () {}),
                    ActionButton(
                        buttonWidth: size.width * .35,
                        buttonHeight: 40,
                        fontColor: kWhiteColor,
                        fontSize: 18,
                        text: 'Add',
                        buttonColor: Colors.white.withOpacity(0.2),
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

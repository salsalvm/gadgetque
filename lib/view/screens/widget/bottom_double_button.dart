import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class BottomDoubleButton extends StatelessWidget {
  const BottomDoubleButton({
    Key? key,
    required this.secondText,
    required this.firstText,
    required this.firstOnTap,
    required this.secondOnTap,
  }) : super(key: key);
  final String secondText;
  final String firstText;
  final Callback firstOnTap;

  final Callback secondOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          radius: 0,
          buttonColor: kGreyColor,
          buttonWidth: size.width * .5,
          buttonHeight: size.width * 0.14,
          text: firstText,
          onTap: firstOnTap,
        ),
        ActionButton(
            radius: 0,
            buttonColor: Colors.orange,
            buttonWidth: size.width * .5,
            buttonHeight: size.width * 0.14,
            text: secondText,
            fontColor: kWhiteColor,
            onTap: secondOnTap)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/buy_product/summary/screen_order_summary.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:get/get.dart';

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
  final firstOnTap;
  
  final secondOnTap;
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

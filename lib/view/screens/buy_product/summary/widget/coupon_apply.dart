
import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class CouponApply extends StatelessWidget {
  const CouponApply({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration:
          BoxDecoration(borderRadius: kRAdius10, color: kBoxColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemText(
                name: 'COUPON',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            DivLine(),
            kHeigt5,
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FormFields(
                fontSize: 22,
                size: 22,
                name: 'voucher number',
                color: Colors.white.withOpacity(.3),
              ),
            ),
            kHeigt5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                    buttonWidth: 140,
                    buttonHeight: 45,
                    text: 'Cancel',
                    fontColor: kWhiteColor,
                    onTap: () {}),
                ActionButton(
                    buttonWidth: 140,
                    buttonHeight: 45,
                    fontColor: kWhiteColor,
                    text: 'Apply',
                    onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

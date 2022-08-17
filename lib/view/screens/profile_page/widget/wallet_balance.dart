import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.33,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: kRAdius10,
        color: kBoxColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemText(
                name: 'Wallet Ballance',
                weight: FontWeight.bold,
                fontSize: 18,
                color: kBlackColor),
            const DivLine(),
            kHeigt5,
            GetBuilder<AuthenticationController>(
              init: AuthenticationController(),
              builder: (controller) => ItemText(
                  name: controller.wallet == null
                      ? '€100'
                      : '€${controller.wallet}',
                  weight: FontWeight.w600,
                  fontSize: 18,
                  color: kGreenColor),
            ),
            kHeigt5,
            ActionButton(
                buttonColor: Colors.white.withOpacity(0.1),
                fontSize: 18,
                buttonWidth: size.width,
                buttonHeight: 38,
                text: ' 🔁  Invite and Earn',
                onTap: () {})
          ],
        ),
      ),
    );
  }
}

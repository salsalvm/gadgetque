import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/my_order_page/widget/list_order.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:get/get.dart';

class ScreenOrder extends StatelessWidget {
  ScreenOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppbarMain(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MainHead(headding: 'My Order', top: 10),
                  IconButton(
                      onPressed: () {
                        Get.snackbar(
                            colorText: kBlackColor,
                            margin: const EdgeInsets.only(top: 60),
                            'Slide to left Cancel Order',
                            '',
                            snackPosition: SnackPosition.TOP);
                      },
                      icon: const Icon(
                        Icons.question_mark,
                        color: kBlueColor,
                      ))
                ],
              ),
              const OrderList(),
              kHeigt20
            ],
          ),
        ),
      ),
    );
  }

  final authController = Get.put(AuthenticationController());

}

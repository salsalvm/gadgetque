import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';

import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NoInternet extends StatelessWidget {
  NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              refresh();
              controller.update();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlackColor,
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: const Center(
              child: SizedBox(
                width: 170,
                child: CustomText(
                    lines: 3,
                    name: 'No Internet please connect a valid wife and explore',
                    weight: FontWeight.normal,
                    fontSize: 18,
                    color: kGreyColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      Get.offAll(const ScreenEntry());
      Get.snackbar(
        ' Internet connected',
        'OK',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kGreenColor,
      );
    }
  }
}

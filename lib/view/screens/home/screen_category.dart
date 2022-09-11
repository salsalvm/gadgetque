import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/home/widget/category_grid.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatelessWidget {
  final String? category;
  ScreenCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return Scaffold(
      backgroundColor: kBoxColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SecondAppbar(title: category!),
      ),
      body: const SafeArea(
        child: CategoryGrid(),
      ),
    );
  }

  final authController = Get.put(AuthenticationController());
}

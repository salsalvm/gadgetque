import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/view/screens/my_order_page/widget/grid_view_product.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class ScreenViewOrder extends StatelessWidget {
  ScreenViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.conectionCheck();
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: SecondAppbar(title: 'View Products'),
      ),
      body:const SafeArea(
        child: ViewProduct(),
      ),
    );
  }

  final authController = Get.put(AuthenticationController());
}

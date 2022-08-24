import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/constant/strings.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/route_manager.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListItems(
              icon: Icons.policy_sharp,
              name: 'Privacy Policy',
              onTap: () {
                Get.defaultDialog(
                  content: SizedBox(
                    height: 500,
                    child: SingleChildScrollView(child: Text(privacy)),
                  ),
                );
              },
            ),
            kHeigt20,
            ListItems(
              name: 'Terms and Condition',
              icon: Icons.check_box,
              onTap: () {
                Get.defaultDialog(
                  content: SizedBox(
                    height: 500,
                    child: SingleChildScrollView(child: Text(condition)),
                  ),
                );
              },
            ),
            kHeigt20,
            ListItems(
              name: 'Contact Developer',
              icon: Icons.person,
              onTap: () {
                Get.defaultDialog(
                    middleText: 'mail : salsalvm1997@gmail.com',
                    title: 'Mob : 7558959094');
              },
            ),
            kHeigt20,
            ListItems(
              name: 'About GadgetsQue',
              icon: Icons.info,
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: const Icon(Icons.blur_on_outlined),
                    applicationName: 'GadgetsQue',
                    applicationVersion: '1.0.1');
              },
            )
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const ListItems({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 60,
            ),
            Icon(
              icon,
              size: 30,
              color: kWhiteColor,
            ),
            kWidth10,
            CustomText(
                name: name,
                weight: FontWeight.w500,
                fontSize: 24,
                color: kWhiteColor)
          ],
        ),
      ),
    );
  }
}

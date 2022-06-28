import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/address/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/address/widget/list_address.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:get/get.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarMain(),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SafeArea(
                child: ListView(
              children: const [
                MainHead(headding: 'Address', top: 10),
                ListAddress(),
              ],
            )),
          ),
          ActionButton(
            radius: 0,
            buttonWidth: size.width,
            buttonHeight: 50,
            text: 'Add New Address',
            onTap: () {
              Get.to(
                const AddEditAddress(),
              );
            },
          )
        ],
      ),
    );
  }
}

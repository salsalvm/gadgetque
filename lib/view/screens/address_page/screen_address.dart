import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/enums/address.dart';
import 'package:gadgetque/view/screens/address_page/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/address_page/widget/list_address.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:get/get.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:const Size.fromHeight(70),
        child: AppbarMain(),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SafeArea(
              child: ListView(
                children: const [
                  MainHead(
                    headding: 'Address',
                    top: 10,
                  ),
                  ListAddress(),
                ],
              ),
            ),
          ),
          ActionButton(
            radius: 0,
            buttonWidth: size.width,
            buttonHeight: 45,
            text: 'Add New Address',
            onTap: () {
              Get.dialog(
               const AddEditAddress(types: Address.isadding),
             
              ); 
            },
          )
        ],
      ),
    );
  }
}

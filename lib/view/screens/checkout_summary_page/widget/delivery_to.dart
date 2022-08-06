import 'package:flutter/material.dart';
import 'package:gadgetque/controller/address_controller.dart';

import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/enums/address.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/address_page/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class DeliveryTo extends StatelessWidget {
  DeliveryTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          height: size.width * .8,
          child: GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (controller) {
              if (controller.address == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                );
              } else if (controller.address!.isEmpty) {
                return const Center(
                  child: ItemText(
                      name:
                          'Address is\nnot available now\nplease add a new address',
                      weight: FontWeight.normal,
                      fontSize: 18,
                      lines: 3,
                      color: kGreyColor),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.address!.length,
                  itemBuilder: (context, index) {
                    final address = controller.address![index].address;
                    List<String> str = address.address!.split(',');
                    str = str.reversed.toList();
                    String temp = '';
                    for (var i = 0; i < str.length; i++) {
                      if (i % 2 == 0) {
                        temp = '${str[i]},\n$temp';
                      } else {
                        temp = '${str[i]},$temp';
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedColorChange(
                              index, address.addressId);
                          controller.update();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: kRAdius10,
                              color: controller.colorChange == index
                                  ? Colors.teal
                                  : kBoxColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ItemText(
                                        name:
                                            'Delivery To :  ${address.type!.toUpperCase()}',
                                        weight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kBlack54Color),
                                    ActionButton(
                                      buttonWidth: size.width * .1,
                                      buttonHeight: size.width * .08,
                                      radius: 5,
                                      text: 'Edit',
                                      fontColor: kWhiteColor,
                                      fontSize: 16,
                                      onTap: () {
                                        Get.dialog(
                                          AddEditAddress(
                                            types: Address.isEditting,
                                            address: address.address,
                                            name: address.name,
                                            mobile: address.mobile,
                                            pin: address.pincode,
                                            type: address.type,
                                            addId: address.addressId,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const DivLine(),
                                ItemText(
                                    name: '${address.name}'.toUpperCase(),
                                    weight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kBlackColor),
                                kHeigt5,
                                ItemText(
                                    name: temp,
                                    lines: 2,
                                    weight: FontWeight.w500,
                                    fontSize: 16,
                                    color: kBlack54Color),
                                kHeigt5,
                                ItemText(
                                    name: '${address.pincode}',
                                    weight: FontWeight.w500,
                                    fontSize: 16,
                                    color: kBlack54Color),
                                ItemText(
                                    name: '+91 ${address.mobile}',
                                    weight: FontWeight.w700,
                                    fontSize: 16,
                                    color: kBlackColor)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 15),
          child: FloatingActionButton(
            onPressed: () {
              Get.dialog(
                const AddEditAddress(types: Address.isadding),
              );
            },
            backgroundColor: kButtonColor,
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

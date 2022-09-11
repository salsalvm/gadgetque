import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/enums/address.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/address_page/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';


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
          height: size.width * .54,
          width: size.width,
          child: GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (controller) {
              if (controller.address == null) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.teal,
                  ),
                );
              } else if (controller.address!.isEmpty) {
                return const Center(
                  child: CustomText(
                      name:
                          'Address is\nnot available now\nplease add a new address',
                      weight: FontWeight.normal,
                      fontSize: 18,
                      lines: 3,
                      color: kGreyColor),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                              index, '${address.addressId}');
                          controller.update();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: kRAdius10,
                                color: controller.colorChange == index
                                    ? const Color.fromARGB(255, 158, 228, 221)
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
                                      CustomText(
                                          name:
                                              'Delivery To :  ${address.type!.toUpperCase()}',
                                          weight: FontWeight.bold,
                                          fontSize: 20,
                                          color: kBlack54Color),
                                     const SizedBox(width: 110,),
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
                                  CustomText(
                                      name: '${address.name}'.toUpperCase(),
                                      weight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kBlackColor),
                                  kHeigt5,
                                  CustomText(
                                      name: temp.trim(),
                                      lines: 2,
                                      weight: FontWeight.w500,
                                      fontSize: 16,
                                      color: kBlack54Color),
                                  kHeigt5,
                                  CustomText(
                                      name: '${address.pincode}',
                                      weight: FontWeight.w500,
                                      fontSize: 16,
                                      color: kBlack54Color),
                                  CustomText(
                                      name: '+91 ${address.mobile}',
                                      weight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor)
                                ],
                              ),
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
        ),
      ],
    );
  }
}

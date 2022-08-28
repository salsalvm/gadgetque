import 'package:flutter/material.dart';
import 'package:gadgetque/controller/address_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/enums/address.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/address_page/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class ListAddress extends StatelessWidget {
  const ListAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.67,
      width: size.width,
      child: GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) => controller.addressList == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.teal,
              ))
            : controller.addressList!.isEmpty
                ? const Center(
                    child: CustomText(
                        name:
                            'Address is\nnot available now\nplease add a new address',
                        weight: FontWeight.normal,
                        fontSize: 18,
                        lines: 3,
                        color: kGreyColor),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      List<String> str = controller
                          .addressList![index].address!.address!
                          .split(',');
                      str = str.reversed.toList();
                      String temp = '';
                      for (var i = 0; i < str.length; i++) {
                        if (i % 2 == 0) {
                          temp = '${str[i]},\n$temp';
                        } else {
                          temp = '${str[i]},$temp';
                        }
                      }

                      return Card(
                        color: kBoxColor,
                        shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      name: controller
                                          .addressList![index].address!.type!,
                                      weight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kBlackColor),
                                  actionIcons(controller, index)
                                ],
                              ),
                              const DivLine(),
                              kHeigt10,
                              CustomText(
                                  name: controller
                                      .addressList![index].address!.name!
                                      .toUpperCase(),
                                  weight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kBlackColor),
                              CustomText(
                                  name: temp.trim().toUpperCase(),
                                  lines: 2,
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kBlack54Color),
                              CustomText(
                                  name: controller
                                      .addressList![index].address!.pincode!,
                                  weight: FontWeight.w500,
                                  fontSize: 16,
                                  color: kBlackColor),
                              CustomText(
                                  name: controller
                                      .addressList![index].address!.mobile!,
                                  weight: FontWeight.w700,
                                  fontSize: 18,
                                  color: kBlackColor)
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.addressList!.length),
      ),
    );
  }

  Wrap actionIcons(AddressController controller, int index) {
    return Wrap(
      children: [
        IconButton(
            onPressed: () {
              Get.dialog(
                AddEditAddress(
                    name: controller.addressList![index].address!.name!,
                    address: controller.addressList![index].address!.address!,
                    mobile: controller.addressList![index].address!.mobile!,
                    pin: controller.addressList![index].address!.pincode!,
                    type: controller.addressList![index].address!.type!,
                    types: Address.isEditting,
                    addId: controller.addressList![index].address!.addressId!),
              );
            },
            icon: Icon(
              Icons.edit,
              color: kGreenColor,
            )),
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              backgroundColor: kBoxColor,
              buttonColor: kButtonColor,
              middleText: 'Do you Want to Remove',
              onConfirm: () {
                controller.removeAddress(
                    controller.addressList![index].address!.addressId!);
                Get.back();
              },
              title: 'Are You Sure',
              onCancel: () {},
            );
          },
          icon: const Icon(
            Icons.delete,
            color: kredColor,
          ),
        ),
      ],
    );
  }
}

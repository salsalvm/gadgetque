import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gadgetque/controller/address_controller.dart';
import 'package:gadgetque/controller/validationController.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/enums/address.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/authentication/widget/error_text.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:get/get.dart';

class AddEditAddress extends StatefulWidget {
  final Address types;
  final String? addId;
  final String? name;
  final String? pin;
  final String? mobile;
  final String? address;
  final String? type;
  const AddEditAddress({
    this.addId,
    required this.types,
    Key? key,
    this.name,
    this.pin,
    this.mobile,
    this.address,
    this.type,
  }) : super(key: key);

  @override
  State<AddEditAddress> createState() => _AddEditAddressState();
}

class _AddEditAddressState extends State<AddEditAddress> {
  @override
  void initState() {
    if (widget.types == Address.isEditting) {
      nameController.text = widget.name!;
      addressController.text = widget.address!;
      mobileController.text = widget.mobile!;
      pinController.text = widget.pin!;
      typeController.text = widget.type!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  if (widget.types == Address.isEditting) {
    //   nameController.text = widget.name!;
    //   addressController.text = widget.address!;
    //   mobileController.text = widget.mobile!;
    //   pinController.text = widget.pin!;
    //   typeController.text = widget.type!;
    // }
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFields(
                  icon: Icons.person,
                  validator: (name) {
                    validController.nameValidation(name);
                  },
                  name: 'name',
                  controller: nameController,
                  color: kFormColor,
                  textColor: kBlack54Color),
              Obx(
                () => ErrorText(
                    errorText: 'minimum 3 character required',
                    isVisible: validController.names.value),
              ),
              FormFields(
                  icon: Icons.home,
                  controller: addressController,
                  validator: (address) {
                    validController.nameValidation(address);
                  },
                  name: 'address',
                  color: kFormColor,
                  textColor: kBlack54Color),
              Obx(
                () => ErrorText(
                    errorText: 'minimum 3 character required',
                    isVisible: validController.names.value),
              ),
              FormFields(
                  icon: Icons.pin,
                  controller: pinController,
                  validator: (pin) {
                    validController.passwordValidation(pin);
                  },
                  name: 'pin',
                  color: kFormColor,
                  textColor: kBlack54Color),
              Obx(
                () => ErrorText(
                    errorText: 'enter minimum 6 digits',
                    isVisible: validController.pass.value),
              ),
              FormFields(
                  controller: typeController,
                  icon: Icons.category,
                  validator: (type) {
                    validController.nameValidation(type);
                  },
                  name: 'type',
                  color: kFormColor,
                  textColor: kBlack54Color),
              Obx(
                () => ErrorText(
                    errorText: 'minimum 3 character required',
                    isVisible: validController.names.value),
              ),
              FormFields(
                  controller: mobileController,
                  icon: Icons.phone,
                  validator: (mobile) {
                    validController.mobileValidation(mobile);
                  },
                  name: 'mobile',
                  color: kFormColor,
                  textColor: kBlack54Color),
              Obx(
                () => ErrorText(
                    errorText: 'enter 10 digits',
                    isVisible: validController.phone.value),
              ),
              kHeigt5,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(
                        buttonWidth: size.width * .35,
                        fontSize: 18,
                        buttonHeight: 40,
                        text: 'Cancel',
                        buttonColor: Colors.white.withOpacity(0.2),
                        fontColor: kWhiteColor,
                        onTap: () {
                          Get.back();
                        }),
                    ActionButton(
                        buttonWidth: size.width * .35,
                        buttonHeight: 40,
                        fontColor: kWhiteColor,
                        fontSize: 18,
                        text:
                            widget.types == Address.isadding ? 'Add' : 'Update',
                        buttonColor: Colors.white.withOpacity(0.2),
                        onTap: () {
                          final name = nameController.text.trim();
                          final address = addressController.text.trim();
                          final pin = pinController.text.trim();
                          final type = typeController.text.trim();
                          final mobile = mobileController.text.trim();
                          if (widget.types == Address.isadding) {
                            if (name.isEmpty ||
                                address.isEmpty ||
                                pin.isEmpty ||
                                type.isEmpty ||
                                type.isEmpty ||
                                mobile.isEmpty) {
                              Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  'fill the field',
                                  'Every Fields Are Required',
                                  colorText: kredColor);
                              return;
                            } else {
                              addController.addAddress(
                                  name, address, pin, mobile, type);
                              Get.back();
                            }
                          } else {
                            addController.updateAddress(name, address, pin,
                                mobile, type, widget.addId!);
                            Get.back();
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final validController = Get.put(ValidationController());

  final addController = Get.put(AddressController());

  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final pinController = TextEditingController();

  final typeController = TextEditingController();

  final mobileController = TextEditingController();
}

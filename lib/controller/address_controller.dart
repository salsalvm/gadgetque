import 'dart:developer';

import 'package:gadgetque/model/address/add_address_model.dart';
import 'package:gadgetque/model/address/get_address_model.dart';
import 'package:gadgetque/model/address/remove_address_model.dart';
import 'package:gadgetque/model/address/update_address_model.dart';
import 'package:gadgetque/services/address_services.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  List<AddressElement>? addressList;

  //------------------get-------------------//
  getAddress() async {
    try {
      final response =
          await AddressServiceEndPoint().getAddress(userId.toString());

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = getAddressModelFromJson(response.data);
        if (datas.user) {
          addressList = datas.addresses.obs;
          update();
        }
      }
    } catch (e) {
      log('ger controller>>>>>>>$e<<<<<<<<<<');
    }
  }

  //------------------add-------------------//
  addAddress(String name, String address, String pin, String mobile,
      String type) async {
    Map<String, dynamic> addressDetails = {
      "name": name,
      "mobile": mobile,
      "address": address,
      "type": type,
      "pincode": pin
    };
    final response = await AddressServiceEndPoint().addAddress(addressDetails);
    log(response.toString());
    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = addAddressModelFromJson(response.data);
        if (datas.acknowledged) {
          getAddress();
          update();
          Get.snackbar(
              'added succesfully', 'address has been added to address list',
              colorText: kGreenColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('add controller>>>>>>>$e<<<<<<<<<<');
    }
  }

  //------------------remove-------------------//
  removeAddress(String addId) async {
    final response =
        await AddressServiceEndPoint().removeAddress(userId.toString(), addId);
    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = removeAddressModelFromJson(response.data);
        if (datas.resp.acknowledged) {
          getAddress();
          update();

          Get.snackbar(
              'removed succesfully', 'address has been removed to list',
              colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('remove controller>>>>>>>$e<<<<<<<<<<');
    }
  }

  //------------------update-------------------//
  updateAddress(String name, String address, String pin, String mobile,
      String type, String addId) async {
    Map<String, dynamic> updattedDetails = {
      "name": name,
      "mobile": mobile,
      "address": address,
      "type": type,
      "pincode": pin,
      "addressId": addId
    };
    try {
      final response =
          await AddressServiceEndPoint().updateAddress(updattedDetails);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = updattedAddressModelFromJson(response.data);
        if (datas.acknowledged) {
          getAddress();
          update();
          Get.snackbar(
              'removed succesfully', 'address has been removed to list',
              colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('update controller>>>>>>>$e<<<<<<<<<<');
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';

class AddressServiceEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));

   //------------------get-------------------//
  Future<Response<dynamic>?> getAddress(String userId) async {
    try {
      final response = await dio.get('my-address/$userId');
      return response;
    } catch (e) {
      log('get services>>>>>>>>$e<<<<<<<<<<');
    }
    return null;
  }

 //------------------add-------------------//
  Future<Response<dynamic>?> addAddress(
      Map<String, dynamic> addressDetails) async {
    try {
      final response = await dio.post('add-address/$userId',
          data: jsonEncode(addressDetails));
      return response;
    } catch (e) {
      log('add services>>>>>>>>$e<<<<<<<<<<');
    }
    return null;
  }

 //------------------remove-------------------//
  Future<Response<dynamic>?> removeAddress(String userId, String addId) async {
    try {
      final response = await dio.get('delete-address/$userId/$addId');
      return response;
    } catch (e) {
      log('remove services>>>>>>>>$e<<<<<<<<<<');
    }
    return null;
  }

 //------------------update-------------------//
  Future<Response<dynamic>?> updateAddress(
      Map<String, dynamic> updattedDetails) async {
    try {
      final response = await dio.post('edit-address/$userId',
          data: jsonEncode(updattedDetails));
      log(response.toString());
      return response;
    } catch (e) {
      log('update services>>>>>>>>$e<<<<<<<<<<');
    }
    return null;
  }
}

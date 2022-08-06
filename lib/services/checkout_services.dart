import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class CheckoutServiceEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> getcheckoutDatas() async {
    try {
      final response = await dio.get('checkout/$userId');

      return response;
    } catch (e) {
      log('get category service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  Future<Response<dynamic>?> applyCoupon(Map<String, dynamic> code) async {
    try {
      final response =
          await dio.post('check-coupon/$userId', data: jsonEncode(code));

      return response;
    } catch (e) {
      log('get service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

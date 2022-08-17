import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class CheckoutServiceEndPoint {
  String discount = '0';
  String coupon = '1';
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

  Future<Response<dynamic>?> applyCoupon( code) async {
    
    try {
      final response =
          await dio.post('check-coupon/$userId/$code');
log(',.,.,.$response');
      return response;
    } catch (e) {
      log('get service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

// `/place-order?payment=${paymentMethod}&addressId=${checkoutAddressId}&disc=${discount}&code=${code}`,
  Future<Response<dynamic>?> placeOrder(paymentMethod, addId) async {
    try {
      final response = await dio.get(
          'place-order/$userId/?payment=$paymentMethod&addressId=$addId&disc=$discount&code=$coupon');

      return response;
    } catch (e) {
      log('placeOrder service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

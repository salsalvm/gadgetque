import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';

class CheckoutServiceEndPoint {
  // String discount = '0';
  // String coupon = '1';
  final dio = Dio(
    BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain),
  );
   //------------------get-------------------//
  Future<Response<dynamic>?> getcheckoutDatas() async {
    try {
   
      final response = await dio.get('checkout/$userId');
// log(response.toString());
      return response;
    } catch (e) {
      log('get category service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
 //------------------apply coupon-------------------//
  Future<Response<dynamic>?> applyCoupon( code) async {
    
    try {
      final response =
          await dio.post('check-coupon/$userId/$code');


      return response;
    } catch (e) {
      log('get service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

 //------------------place order-------------------//
  Future<Response<dynamic>?> placeOrder(paymentMethod, addId,disc,code) async {
    log('$paymentMethod, $disc,$code');
    try {
      final response = await dio.get(
          'place-order/$userId/?payment=$paymentMethod&addressId=$addId&disc=$disc&code=$code');

      return response;
    } catch (e) {
      log('placeOrder service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

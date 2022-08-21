import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';

class OrderServicesEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));
 //------------------get oDet-------------------//
  Future<Response<dynamic>?> getOrderDetails() async {
    try {
      final response = await dio.get('my-orders/$userId');

      return response;
    } catch (e) {
      log('get services>>>>>>>>>$e<<<<<<<<<<<');
    }
    return null;
  }
 //------------------get oProd-------------------//
  Future<Response<dynamic>?> getOrderProduct(String orderId) async {
   
    try {
      final response = await dio.get('view-order-products/$orderId/$userId');
    
      return response;
    } catch (e) {
      log('get services>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }
   //------------------cancel order-------------------//
  Future<Response<dynamic>?> canceOrder(String orderId) async {
    try {
      final response = await dio.get('cancel-order/$orderId');
    log(',,,,$response>>>');
      return response;
    } catch (e) {
      log('get services>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }
}

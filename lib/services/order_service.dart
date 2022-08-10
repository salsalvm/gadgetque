import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class OrderServicesEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));

  Future<Response<dynamic>?> getOrderDetails() async {
    try {
      final response = await dio.get('my-orders/$userId');

      return response;
    } catch (e) {
      log('get services>>>>>>>>>$e<<<<<<<<<<<');
    }
    return null;
  }

  Future<Response<dynamic>?> getOrderProduct(String orderId) async {
   
    try {
      final response = await dio.get('view-order-products/$orderId/$userId');
    
      return response;
    } catch (e) {
      log('get services>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }
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

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class CartServiceEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));
  //>>>>>>>>>>>>>get item<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> getCartItems(userId) async {
    try {
      final response = await dio.get('cart/$userId');
      return response;
    } catch (e) {
      log('get services>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }

//>>>>>>>>>>>>>add item<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> addCartItems(String productId) async {
    try {
      final response = await dio.get('add-to-cart/$productId/$userId');
      return response;
    } catch (e) {
      log('add services>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
    return null;
  }

//>>>>>>>>>>>>>delete item<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> removeCartItems(
      Map<String, dynamic> removeData) async {
    try {
      final response =
          await dio.post('remove-cart-product', data: jsonEncode(removeData));
      return response;
    } catch (e) {
      log('remove services>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

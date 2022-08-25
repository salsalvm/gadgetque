import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';

class CartServiceEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));
  //------------------get-------------------//
  Future<Response<dynamic>?> getCartItems(userId) async {
    try {
      final response = await dio.get('cart/$userId');
      return response;
    } catch (e) {
      log('get services>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }

 //------------------add-------------------//
  Future<Response<dynamic>?> addCartItems(String productId) async {
    try {
      final response = await dio.get('add-to-cart/$productId/$userId');
      return response;
    } catch (e) {
      log('add services>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
    return null;
  }

 //------------------remove-------------------//
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

 //------------------quantity actions-------------------//
  Future<Response<dynamic>?> quantityCartItem(
      Map<String, dynamic> cartDetails) async {
    try {
      final response = await dio.post('change-product-quantity',
          data: jsonEncode(cartDetails));
      return response;
    } catch (e) {
      log('quantity services>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

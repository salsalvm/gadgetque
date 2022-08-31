import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';

class AuthServices {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain),
  );
  //------------------log in-------------------//
  Future<Response<dynamic>?> checkLogin(signinData) async {
    try {
      final response = await dio.post('login', data: jsonEncode(signinData));

      return response;
    } catch (e) {
      log('login>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------sign in-------------------//
  Future<Response<dynamic>?> checkSignin(signupData) async {
    try {
      final response = await dio.post('signup', data: jsonEncode(signupData));
      return response;
    } catch (e) {
      log('signup>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------sign out-------------------//
  Future<Response<dynamic>?> checkSignout() async {
    try {
      final respose = await dio.get('logout');
      return respose;
    } catch (e) {
      log('logout>>>>>>>>>>>$e<<<<<<<<<<<<<');
    }
    return null;
  }
}

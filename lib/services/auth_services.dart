import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';

class AuthServices {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain),
  );
  //------------------log in-------------------//
  Future<Response<dynamic>?> checkLogin(signinData) async {
    final response = await dio.post('login', data: jsonEncode(signinData));

    return response;
  }

  //------------------sign in-------------------//
  Future<Response<dynamic>?> checkSignin(signupData) async {
    final response = await dio.post('signup', data: jsonEncode(signupData));
    return response;
  }

  //------------------sign out-------------------//
  Future<Response<dynamic>?> checkSignout() async {
    final respose = await dio.get('logout');
    return respose;
  }
}

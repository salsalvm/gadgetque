import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://54.175.202.116/', responseType: ResponseType.plain));
//<<<<<<<<<<<<<check signin status>>>>>>>>>>>>>>>>>>>>//
  Future<Response<dynamic>?> checkLogin(signinData) async {
    final response = await dio.post('login', data: jsonEncode(signinData));
    // log(response.toString());
    return response;
  }

  //<<<<<<<<<<<<<<<check signin status>>>>>>>>>>>>>>>>>>>>>//
  Future<Response<dynamic>?> checkSignin(signupData) async {
    final response = await dio.post('signup', data: jsonEncode(signupData));
    return response;
  }

  Future<Response<dynamic>?> checkSignout() async {
    final respose = await dio.get('logout');
    return respose;
  }
}

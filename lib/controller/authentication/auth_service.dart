import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://54.175.202.116/', responseType: ResponseType.plain));

  Future<Response<dynamic>?> checkLogin(signinData) async {
    final response = await dio.post('login', data: jsonEncode(signinData));
    // log(response.toString());
    return response;
  }
}

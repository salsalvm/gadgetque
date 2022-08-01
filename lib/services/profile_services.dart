import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class ProfileServicesEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));
  Future<Response<dynamic>?> getProfile() async {
    try {
      final response = await dio.get('my-profile/$userId');

      return response;
    } catch (e) {
      log('get service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  Future<Response<dynamic>?> updateProfile(Map updatedDetails) async {
    try {
      final response = dio.post('update-details/$userId',data: jsonEncode(updatedDetails));
      return response;
    } catch (e) {
      log('update service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

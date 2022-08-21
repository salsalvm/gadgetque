import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';

class ProfileServicesEndPoint {
  final dio =
      Dio(BaseOptions(baseUrl: kBaseurl, responseType: ResponseType.plain));
  //------------------get-------------------//
  Future<Response<dynamic>?> getProfile() async {
    try {
      final response = await dio.get('my-profile/$userId');

      return response;
    } catch (e) {
      log('get service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------update-------------------//
  Future<Response<dynamic>?> updateProfile(Map updatedDetails) async {
    try {
      final response =
          dio.post('update-details/$userId', data: jsonEncode(updatedDetails));
      return response;
    } catch (e) {
      log('update service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

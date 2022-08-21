import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/url.dart';

class HomeServices {
  final dio = Dio(
    BaseOptions(responseType: ResponseType.plain, baseUrl: kBaseurl),
  );
   //------------------get home-------------------//
  Future<Response<dynamic>?> getHomeDatas() async {
    try {
      final response = await dio.get('');
      return response;
    } catch (e) {
      log('get home service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
 //------------------get categories-------------------//
  Future<Response<dynamic>?> getCatogoriesDatas(String category) async {
    try {
      final response = await dio.get('categoryWise/$category');
      return response;
    } catch (e) {
      log('get category service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}

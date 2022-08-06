import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class HomeServices {
  final dio = Dio(
    BaseOptions(responseType: ResponseType.plain, baseUrl: kBaseurl),
  );
  Future<Response<dynamic>?> getHomeDatas() async {
    try {
      final response = await dio.get('');
      return response;
    } catch (e) {
      log('get home service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

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

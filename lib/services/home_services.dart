import 'package:dio/dio.dart';
import 'package:gadgetque/view/constant/core/url.dart';

class HomeServices {
  final dio = Dio(
    BaseOptions(responseType: ResponseType.plain, baseUrl: kBaseurl),
  );
  Future<Response<dynamic>?> getHomeDatas() {
    final response = dio.get('');
    return response;
  }

  Future<Response<dynamic>?> getCatogoriesDatas(String category)async {
    final response =await dio.get('categoryWise/$category');
    return response;
  }
}

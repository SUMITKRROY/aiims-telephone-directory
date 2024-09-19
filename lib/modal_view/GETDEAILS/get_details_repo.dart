import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class GetDetailsRepo {
  static Future<Response> GetDetail() async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio.get(ApiStrings.getDetails);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

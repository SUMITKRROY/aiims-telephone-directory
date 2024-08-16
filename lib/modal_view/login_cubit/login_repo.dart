import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class LoginRepo {
  static Future<Response> getLogin(
      {required String empId, required String otp}) async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio
          .post(ApiStrings.login, data: {"employeeId": empId, "otp": otp});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

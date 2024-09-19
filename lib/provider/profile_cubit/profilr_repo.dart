
import 'package:dio/dio.dart';

import '../../config/api_route.dart';
import '../../helper/dio_helper.dart';
import '../../utils/dio_helper.dart';

class ProfileRepo {
  final ApiRoute route = ApiRoute();

  // Future<Response> getProfileData() async {
  //   try {
  //     List<Map<String, dynamic>> data = await LoginTable().getUserData();
  //     String? token = data.first[LoginTable.sessionId];
  //     Dio dio = DioApi(isHeader: true, token: token).sendRequest;
  //
  //     final response = await dio.get(route.getUser);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<Response> getProfileData() async {
    try {

      return null!;
    } catch (e) {
      rethrow;
    }
  }
}
